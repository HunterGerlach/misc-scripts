# certificate authority / certificate creation

## Description

This is a simple script that wil help you quickly create your own self-signed TLS certs and CA for use in local browsers for your applications.

## Usage

First, create the certificates by using the provided script. Then, use the certificates. Finally, relax - that's all there is.

### Certifacate Creation

1. Make the file executable: `chmod +x self-signed-tls.sh`
2. Run the script: `./self-signed-tls.sh`
3. Answer the on-screen prompts with your desired answers
4. Navigate to find your certs: `cd minted-certs`

### Add Certs to Browser

To make the Google Chrome browser recognize the certificates, add the appropriate CA cert:

1. Open Chrome
2. Navigate to Settings
3. Search for `Manage Certificates`
4. Select Authorities
5. Choose Import
6. Navigate to certificates location
7. Choose CA cert: `www.example.com_CA.pem`
8. Select which authorities should be granted (eg. Website)
9. Save and restart Chrome


