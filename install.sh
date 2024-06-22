____________________________________________________________________________________________________________________________

#!/bin/bash

# Update package lists
apt-get update

# Install Golang
apt install golang-go

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install and copy tool (with error handling)
install_tool() {
    go install "$1" && cp "/root/go/bin/$(basename "$1")" /usr/bin
    if ! command_exists "$(basename "$1")"; then
        echo "Error installing $(basename "$1"). Aborting."
        exit 1
    fi
}

# Install and copy Amass
install_tool "github.com/owasp-amass/amass/v4/...@master"

# Install and copy anew
install_tool "github.com/tomnomnom/anew@latest"

# ... (other tools)

# Install and copy cariddi
install_tool "github.com/edoardottt/cariddi/cmd/cariddi@latest"

_________________________________________________________________________________________


#!/bin/bash

# Update package lists
apt-get update

# Install Golang
apt install golang-go

# Install and copy Amass
go install -v github.com/owasp-amass/amass/v4/...@master && cp /root/go/bin/amass /usr/bin

# Install and copy anew
go install -v github.com/tomnomnom/anew@latest && cp /root/go/bin/anew /usr/bin

# Install and copy alterx
go install github.com/projectdiscovery/alterx/cmd/alterx@latest && cp /root/go/bin/alterx /usr/bin

# Download and unzip findomain
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
unzip findomain-linux-i386.zip
chmod +x findomain
mv findomain /usr/bin/findomain

# Install dnsgen
git clone https://github.com/AlephNullSK/dnsgen.git
cd dnsgen
pip3 install dnsgen

# Install Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt
ln -sfv /opt/Sublist3r/sublist3r.py /usr/bin/sublist3r
cd ..

# Install and copy httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && cp /root/go/bin/httpx /usr/bin

# Install and copy httprobe
go install github.com/tomnomnom/httprobe@latest && cp /root/go/bin/httprobe /usr/bin

# Install and copy gau
go install github.com/lc/gau/v2/cmd/gau@latest  && cp /root/go/bin/gau /usr/bin

# Install and copy waybackurls
go install github.com/tomnomnom/waybackurls@latest && cp /root/go/bin/waybackurls /usr/bin

# Install and copy cariddi
go install -v github.com/edoardottt/cariddi/cmd/cariddi@latest && cp /root/go/bin/cariddi /usr/bin
