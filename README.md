 Subdomain Enumeration and URL Crawling Script
<p align="center"><img src="https://github.com/user-attachments/assets/c89f18a0-7d7e-470c-8ae0-5f528c449ec6" width="100%" height="30%"/></p>


This Bash script automates subdomain enumeration, checks for live subdomains, and discovers URLs associated with a target domain. It combines various tools to provide a comprehensive list of subdomains and relevant URLs.

## Features

- Subdomain enumeration using tools like `subfinder`, `assetfinder`, and `alterx`.
- Live subdomain verification with `httpx` and `httprobe`.
- URL discovery using tools like `gau`, `waybackurl`, and `cariddi`.
- (Optional) Additional step using `katana` (if available).

## Usage

1. Make sure you have the necessary tools installed:
   - `subfinder`
   - `assetfinder`
   - `alterx` (verify the correct tool name)
   - `python3` (for `sublist3r.py`)
   - `httpx`
   - `httprobe`
   - (Optional) `katana`

2. Clone or download this repository.

3. Run the script with the target domain as an argument:
   ```bash
   bash enum.sh -d target.com
   ```

4. The script will create the following files:
   - `subdomains.txt`: List of discovered subdomains.
   - `livesubdomains.txt`: Verified live subdomains.
   - `urls.txt`: Discovered URLs.

## Notes

- Customize the script by adjusting tool options or adding/removing steps.
- Replace `sublist3r.py` with the actual path to the `sublist3r.py` script.
- Uncomment the last line for the `katana` step if applicable.

Feel free to contribute or enhance the script as needed!

