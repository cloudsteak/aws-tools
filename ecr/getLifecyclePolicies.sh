#!/bin/bash

# Get the list of repository names
repos=$(aws ecr describe-repositories --output json --query 'repositories[].repositoryName' | jq -r '.[]')

# Create the JSON file
echo "[" >livecycle_policy.json

# Create the no_policy.txt file
echo "No lifecycle policy found for the following repositories:" >no_policy.txt

# Convert repos to an array
repos_array=($repos)

# Get the number of elements in the array
num_repos=${#repos_array[@]}

# Initialize the counters
num_items=0
count_repos_with_no_policy=0
count_repos_with_policy=0

# Iterate over each repository name
for repo in $repos; do
    num_items=$((num_items + 1))
    echo "$num_items/$num_repos. Checking repository: $repo"
    # Get the lifecycle policy for the repository
    result=$(aws \
        ecr get-lifecycle-policy \
        --repository-name "$repo" 2>/dev/null)
    
    # Get the exit code of the previous command
    exit_code=$?

    # If the exit code is not 0, then there is no policy for the repository
    if [[ $exit_code -ne 0 ]]; then
        # Print the repository name to the no_policy.txt file
        echo "- $repo" >>no_policy.txt
        # Increment the count of repositories with no policy
        count_repos_with_no_policy=$((count_repos_with_no_policy + 1))
    else
        # Convert the lifecyclePolicyText field to JSON and include all fields
        result=$(echo "$result" | jq '.lifecyclePolicyText |= fromjson')
        echo "$result" >>livecycle_policy.json
        echo ", " >>livecycle_policy.json
        # Increment the count of repositories with policy
        count_repos_with_policy=$((count_repos_with_policy + 1))
    fi
done

# Remove the last comma from the livecycle_policy.json file
sed -i '' -e '$ d' livecycle_policy.json

# Close the JSON array
echo "]" >>livecycle_policy.json

# Print the results
echo "Number of repositories with policy: $count_repos_with_policy"
echo "Number of repositories with no policy: $count_repos_with_no_policy"


# Print the location of the result files
echo "Result files: livecycle_policy.json, no_policy.txt"
