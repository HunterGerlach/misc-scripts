#!/bin/bash

NODE_PREFIX="node"
NODE_URL="http://nodejs.org/dist/latest/"
NODE_OUTPUT="node.tar.gz"
NODE_LINK="node"

echo "Downloading latest version of Node..."
curl -s http://nodejs.org/dist/latest/ | grep "linux-x64.tar.gz" | cut -d \> -f 2 | cut -d \< -f 1 | xargs echo $NODE_URL | tr -d " " | wget -i - -O ${NODE_OUTPUT}

echo "Expanding node archive..."
tar -xvf ${NODE_OUTPUT}

echo "Moving to application directory..."
mv ${NODE_PREFIX}-* ${HOME}/apps/

echo "Creating symlink..."
ln -s ${HOME}/apps/${NODE_PREFIX}-* ${HOME}/bin/${NODE_LINK}

echo "Adding settings to .bashrc..."
echo "# Node for Angular" >> ~/.bashrc
echo "export NODE_HOME=\${HOME}/bin/${NODE_LINK}" >> ~/.bashrc
echo 'export PATH=${NODE_HOME}/bin:${PATH}' >> ~/.bashrc

echo "Done with automated setup."
echo "Don't forget to run the following commands prior to your first build attempt:"
echo "    source ~/.bashrc"


# Get current npm version
#npm -v

#npm install -g @angular/cli

#echo "" >> ~/.bashrc
#echo "# Angular Settings" >> ~/.bashrc
#NODE_PATH=$(which node)
#echo "export PATH=${NODE_PATH}:\${PATH}" >> ~/.bashrc
#NPM_PATH=$(which npm)
#echo "export PATH=${NPM_PATH}:\${PATH}" >> ~/.bashrc

#echo "Remember to run \"source ~/.bashrc\""
