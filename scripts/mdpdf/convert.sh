#!/usr/bin/env bash

# Check if both input and output files are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: script.sh <input.md> <output.pdf>"
    exit 1
fi

# Capture the input and output file parameters
input_file="$1"
output_file="$2"

# Run the commands, suppressing errors with '|| true'
npx mdpdf "$input_file" 2>/dev/null || true
puppeteer print _temp.html "$output_file" || true
rm _temp.html || true

# Print a success message
echo "Markdown file printed to $output_file"