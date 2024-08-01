#!/bin/bash

# Directory to scan for asset files
ASSET_DIR="../../../assets/animations"

# Output Dart file
OUTPUT_FILE="../resources/animation_res.dart"

# Create the output file and write the header
echo "Generating Dart class for asset files..."
echo "// ignore_for_file: constant_identifier_names" > $OUTPUT_FILE
echo "class AnimationRes {" >> $OUTPUT_FILE
echo "  AnimationRes._();" >> $OUTPUT_FILE

# Scan the directory for asset files
find $ASSET_DIR -type f | while read file; do
  # Remove leading "../../../" from file path
  cleaned_file=$(echo "$file" | sed 's#^\.\./\.\./\.\./##')
  # Extract the filename without the path and extension
  filename=$(basename "$cleaned_file")
  # Get the name without the extension
  name="${filename%.*}"
  # Convert name to uppercase and replace non-alphanumeric characters with underscores
  constant_name=$(echo "$name" | tr '[:lower:]' '[:upper:]' | sed 's/[^A-Z0-9]/_/g')
  # Write the constant to the Dart file
  echo "  static const String $constant_name = \"$cleaned_file\";" >> $OUTPUT_FILE
done

# Close the class definition
echo "}" >> $OUTPUT_FILE

echo "Dart class generated at $OUTPUT_FILE"