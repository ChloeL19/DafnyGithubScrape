import requests
import os
import json
import base64
from github_config import GITHUB_TOKEN

# Constants
SEARCH_URL = 'https://api.github.com/search/repositories'
BRANCHES_URL_TEMPLATE = 'https://api.github.com/repos/{owner_repo}/branches'
SEARCH_QUERY = 'language:Dafny'  # Adjust if needed
PER_PAGE = 100
OUTPUT_FILE = 'dafny_repositories_with_branches.jsonl'

# Headers for the GitHub API
headers = {
    'Authorization': f'token {GITHUB_TOKEN}',
    'Accept': 'application/vnd.github.v3+json',
}

def get_branches_for_repo(owner_repo):
    """Fetch all branches for a given repository."""
    branches = []
    branches_url = BRANCHES_URL_TEMPLATE.format(owner_repo=owner_repo)
    while True:
        response = requests.get(branches_url, headers=headers)
        if response.status_code == 200:
            branches_data = response.json()
            branches.extend([branch['name'] for branch in branches_data])
            # Check if there is a 'next' page for branches
            if 'next' in response.links:
                branches_url = response.links['next']['url']
            else:
                break
        else:
            print(f"Failed to fetch branches for {owner_repo}")
            break
    return branches

def search_repositories(query, per_page, output_file):
    page = 1

    with open(output_file, 'w') as file:
        while True:
            params = {'q': query, 'per_page': per_page, 'page': page}
            response = requests.get(SEARCH_URL, headers=headers, params=params)
            if response.status_code != 200:
                print(f"Failed to fetch page {page}: {response.status_code}")
                break

            data = response.json()
            items = data.get('items', [])
            if not items:
                break

            for item in items:
                repo_name = item['full_name']
                branches = get_branches_for_repo(repo_name)
                record = json.dumps({
                    'name': repo_name,
                    'branches': branches
                })
                file.write(record + '\n')

            print(f"Page {page}: {len(items)} repositories processed.")

            if 'next' not in response.links:
                break

            page += 1

    print(f"Data written to {output_file}.")

# Ensure your GitHub token is correctly set
if GITHUB_TOKEN == 'your_github_token':
    print("Please set your GitHub token before running the script.")
else:
    search_repositories(SEARCH_QUERY, PER_PAGE, OUTPUT_FILE)
