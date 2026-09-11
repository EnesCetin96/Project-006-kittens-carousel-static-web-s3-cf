#!/bin/bash
# Uploads the static-web/ folder to the website bucket created by cloudfrontcfn.yaml.
# Usage: ./upload-script.sh [bucket-name]
set -euo pipefail

BUCKET="${1:-kittens.kernelforgestudio.com}"

# --delete removes objects from the bucket that no longer exist locally
aws s3 sync "$(dirname "$0")/static-web" "s3://$BUCKET" --delete
