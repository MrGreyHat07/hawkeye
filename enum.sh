#!/bin/bash

# Your other script logic goes here...

# Print the logo
echo "  _                          _                          "
echo " | |                        | |                         "
echo " | |__     __ _  __      __ | | __   ___   _   _    ___ "
echo " | '_ \   / _\` | \ \ /\ / / | |/ /  / _ \ | | | | / _ \\"
echo " | | | | | (_| |  \ V  V /  |   <  |  __/ | |_| | |  __/"
echo " |_| |_|  \__,_|   \_/\_/   |_|\_\  \___|  \__, |  \___|"
echo "                                            __/ |       "
echo "                                           |___/        "
                                       echo " By - Mr.GreyHat "


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
echo "Initiating the Enumeration...."
# Subdomain enumeration
echo "$domain" | subfinder | anew subdomains.txt
echo "$domain" | assetfinder | anew subdomains.txt
echo "$domain" | alterx | anew subdomains.txt
sublist3r -d "$domain" | anew subdomains.txt

# Check live subdomains
echo "Checking for live subdomains..."
cat subdomains.txt | httpx | anew livesubdomains.txt
cat subdomains.txt | httprobe | anew livesubdomains.txt

# URL discovery
echo " Crawling urls... "
cat livesubdomains.txt | gau | anew urls.txt
cat livesubdomains.txt | waybackurl | anew urls.txt
cat livesubdomains.txt | cariddi | anew urls.txt

# Additional step (if applicable)
katana -u livesubdomains.txt | anew urls.txt
