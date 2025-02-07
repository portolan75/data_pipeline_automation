#!/usr/bin/env bash

VENV_NAME=$1

# Ensure Python3 and venv are installed
    # python3.11-dev \
    # python3.11-venv \
    # python3.11-distutils \
    # python3.11-gdbm \
    # python3.11-tk \

# Update all packages installed in Dockerfile and eventually install new desired packages (including a different Python version from the Debian/Ubuntu default)
apt-get update && apt-get install -y --no-install-recommends \
    python3.11-dev python3.11-venv python3.11-distutils \
    gcc build-essential \
    && rm -rf /var/lib/apt/lists/*

# Remove existing (possibly broken) venv
if [ -d "/opt/$VENV_NAME" ]; then
    rm -rf "/opt/$VENV_NAME"
fi

# Create the virtual environment using the desired python version
python3.11 -m venv /opt/$VENV_NAME

# Validate venv creation
if [ ! -f "/opt/$VENV_NAME/bin/activate" ]; then
    echo "❌ ERROR: Virtual environment creation failed!"
    exit 1
fi

# # Add venv activation to .bashrc
# echo "source /opt/$VENV_NAME/bin/activate" >> ~/.bashrc
# Make sure the venv is activated when a new shell is started
echo "export PATH=/opt/$VENV_NAME/bin:$PATH" >> ~/.bashrc

# Activate the virtual environment to install dependencies   
source /opt/$VENV_NAME/bin/activate 

# Upgrade pip
pip install --upgrade pip

# Install Python dependencies
pip3 install  --no-cache-dir -r ./settings/requirements.txt

# Optionally, install other desired packages
# pip install <other-package>