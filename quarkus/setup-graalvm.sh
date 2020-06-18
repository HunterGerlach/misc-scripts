#!/bin/bash

PREFIX="graalvm-ce"
VERSION="java11-linux-amd64"
OUTPUT="graalvm-download.tar.gz"
LINK="graalvm"

echo "Downloading latest version of GraalVM..."
curl -s https://api.github.com/repos/graalvm/graalvm-ce-builds/releases/latest \
| grep "browser_download_url.*tar.gz" | grep "${VERSION}*" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i - -O ${OUTPUT}

echo "Expanding archive..."
tar -xvf ${OUTPUT}

echo "Removing archive..."
rm -rf ${OUTPUT}

echo "Moving to application directory..."
mv ${PREFIX}-* $HOME/apps/

echo "Creating symlink..."
ln -s ${HOME}/apps/${PREFIX}-* ${HOME}/bin/${LINK}

echo "Adding settings to .bashrc..."
echo "# GraalVM Settings" >> ~/.bashrc
echo "export GRAALVM_HOME=\${HOME}/bin/${LINK}" >> ~/.bashrc
echo 'export JAVA_HOME=${GRAALVM_HOME}' >> ~/.bashrc
echo 'export PATH=${GRAALVM_HOME}/bin:${PATH}' >> ~/.bashrc

echo "Done with automated setup."
echo "Don't forget to run the following commands prior to your first build attempt:"
echo "    source ~/.bashrc"
echo "    gu install native-image"
