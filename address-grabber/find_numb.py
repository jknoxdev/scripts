import os
import requests
import csv

def get_api_key():
    keys_folder = os.path.expanduser('~/keys')
    keys_file = os.path.join(keys_folder, 'jknoxdev_testing_tomtomapi.key')
    
    if os.path.exists(keys_file):
        with open(keys_file, 'r') as file:
            api_key = file.read().strip()
            return api_key
    else:
        print(f"API key file not found: {keys_file}")
        return None

def get_address(api_key, company_name):
    url = 'https://api.tomtom.com/search/2/search/{query}.json'
    params = {'query': company_name, 'key': api_key}
    
    response = requests.get(url.format(query=company_name), params=params)
    data = response.json()
    
    if 'results' in data and data['results']:
        result = data['results'][0]
        address = result.get('address', {})
        street_number = address.get('streetNumber', 'N/A')
        street_name = address.get('streetName', 'N/A')
        return [company_name, street_number, street_name]
    
    return [company_name, 'N/A', 'N/A']

def main():
    api_key = get_api_key()
    if api_key is None:
        return
    
    input_file = 'clients.txt'  # Path to your input file
    output_file = 'output.csv'  # Path to your output file
    
    with open(input_file, 'r') as file:
        companies = file.read().splitlines()
    
    with open(output_file, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Name', 'Street Number', 'Street Name'])
        
        for company in companies:
            address = get_address(api_key, company)
            writer.writerow(address)
            print(f"getting {company} at {address}")
    
    print(f"Data written to {output_file} successfully!")

if __name__ == '__main__':
    main()
