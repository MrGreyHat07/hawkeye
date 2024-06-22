
#!/bin/bash

# Parse command-line arguments
while getopts ":d:" opt; do
  case $opt in
    d)
      domain="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Subdomain enumeration
echo "$domain" | subfinder | anew subdomains.txt
echo "$domain" | assetfinder | anew subdomains.txt
echo "$domain" | alterx | anew subdomains.txt
python3 sublist3r.py -d "$domain"

# Check live subdomains
cat subdomains.txt | httpx | anew livesubdomains.txt
cat subdomains.txt | httprobe | anew livesubdomains.txt

# URL discovery
cat livesubdomains.txt | gau | anew urls.txt
cat livesubdomains.txt | waybackurl | anew urls.txt
cat livesubdomains.txt | cariddi | anew urls.txt

# Additional step (if applicable)
katana -u livesubdomains.txt | anew urls.txt

