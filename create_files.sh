#!/bin/bash

input_file="input.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' not found."
  exit 1
fi

# Read the input file line by line
while IFS= read -r line; do
  # Extract the last string after the last slash
  filename="${line##*/}"

  # Replace "%20" with "_"
  filename="${filename//%20/_}"

  # Generate the output file name with the extracted filename and .strm extension
  output_file="${filename}.strm"

  # Write the line to the output file
  echo "$line" > "$output_file"

  echo "Created file: $output_file"
done < "$input_file"

