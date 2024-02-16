import requests
import time
from github_config import GITHUB_TOKEN

# Constants
API_URL = 'https://api.github.com/search/repositories'
SEARCH_QUERY = 'language:Dafny'  # Adjust if GitHub does not directly recognize Dafny
PER_PAGE = 10000000  # Max results per page, up to 100
OUTPUT_FILE = 'dafny_repositories.txt'

# Headers for the GitHub API
headers = {
    'Authorization': f'token {GITHUB_TOKEN}',
    'Accept': 'application/vnd.github.v3+json',
}

def search_repositories(query, per_page, output_file):
    page = 1
    repo_names = []

    while True:
        params = {'q': query, 'per_page': per_page, 'page': page}
        response = requests.get(API_URL, headers=headers, params=params)
        if response.status_code != 200:
            print(f"Failed to fetch page {page}: {response.status_code}")
            break

        data = response.json()
        items = data.get('items', [])
        if not items:
            break

        for item in items:
            repo_names.append(item['full_name'])

        print(f"Page {page}: {len(items)} repositories found.")

        if 'next' not in response.links:
            break

        page += 1
        time.sleep(10)  # Sleep to avoid hitting rate limits

    with open(output_file, 'w') as file:
        for name in repo_names:
            file.write(f"{name}\n")

    print(f"Found {len(repo_names)} repositories. Names written to {output_file}.")

# Ensure your GitHub token is correctly set
if GITHUB_TOKEN == 'your_github_token':
    print("Please set your GitHub token before running the script.")
else:
    search_repositories(SEARCH_QUERY, PER_PAGE, OUTPUT_FILE)

