import requests
import os
import json
from github_config import GITHUB_TOKEN
import base64

# Constants
SEARCH_QUERY = 'language:Dafny'  # Search for Dafny files
API_URL = 'https://api.github.com/search/code'
OUTPUT_FILE = 'dafny_files.jsonl'  # Output JSONL file
PER_PAGE = 100000000  # Max items per page

# Headers for the GitHub API
headers = {
    'Authorization': f'token {GITHUB_TOKEN}',
    'Accept': 'application/vnd.github.v3+json',
}

# Prepare the output file
if os.path.exists(OUTPUT_FILE):
    os.remove(OUTPUT_FILE)

# Function to fetch file content
def fetch_file_content(url):
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    file_data = response.json()
    # GitHub API returns the file content in base64, so we decode it
    return base64.b64decode(file_data['content']).decode('utf-8')

# Pagination
page = 1

# For tracking total number of files downloaded
total = 0
logged = 0

while page < 100000:
    # Update params with the current page
    print(f"----------Page = {page}--------------")
    params = {
        'q': SEARCH_QUERY,
        'per_page': PER_PAGE,
        'page': page,
    }
    
    try:
        response = requests.get(API_URL, headers=headers, params=params)
        response.raise_for_status()
        search_results = response.json()
    except:
        break

    if not search_results.get('items'):
        break  # Break the loop if no more items are found

    for item in search_results.get('items', []):
        file_url = item['html_url']
        file_api_url = item['url']
        repo_name = item['repository']['full_name']
        
        # track total number of dafny files
        total += 1

        # Fetch the content of each file
        try:
            content = fetch_file_content(file_api_url)
        except Exception as e:
            print(f"Error fetching content for {file_url}: {e}")
            continue

        # Write information to the JSONL file
        with open(OUTPUT_FILE, 'a', encoding='utf-8') as f:
            json_record = json.dumps({
                'source': file_url,
                'repo': repo_name,
                'content': content
            })
            f.write(json_record + '\n')
        print(f"Recorded f{file_url}")
        logged += 1

    # Check if there are more pages
    #if 'next' not in response.links:
    #    break

    page += 1

print("Data collection completed.")
print(f"{total} total files and {logged} logged files.")

