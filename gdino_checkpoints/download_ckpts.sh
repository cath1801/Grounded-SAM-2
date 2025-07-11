#!/bin/bash

# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.

# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.


# Use either wget or curl to download the checkpoints
if command -v wget &> /dev/null; then
    CMD="wget"
elif command -v curl &> /dev/null; then
    CMD="curl -L -O"
else
    echo "Please install wget or curl to download the checkpoints."
    exit 1
fi

# Define the URLs for the checkpoints
BASE_URL="https://github.com/IDEA-Research/GroundingDINO/releases/download/"
swint_ogc_url="${BASE_URL}v0.1.0-alpha/groundingdino_swint_ogc.pth"
# swinb_cogcoor_url="${BASE_URL}v0.1.0-alpha2/groundingdino_swinb_cogcoor.pth"



# Download each of the four checkpoints using wget
echo "Downloading groundingdino_swint_ogc.pth checkpoint..."
$CMD $swint_ogc_url || { echo "Failed to download checkpoint from $swint_ogc_url"; exit 1; }


# echo "Downloading groundingdino_swinb_cogcoor.pth checkpoint..."
# wget $swinb_cogcoor_url || { echo "Failed to download checkpoint from $swinb_cogcoor_url"; exit 1; }

echo "All checkpoints are downloaded successfully."
