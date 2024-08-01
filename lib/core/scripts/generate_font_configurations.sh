#!/bin/bash

# Root directory to scan for font files
ROOT_FONT_DIR="../../../assets/fonts"

# Function to determine the style and weight from the filename
get_style_and_weight() {
  local filename=$1
  style="normal"
  weight=400

  if [[ $filename == *"Italic"* ]]; then
    style="italic"
  fi

  if [[ $filename == *"Black"* ]]; then
    weight=900
  elif [[ $filename == *"ExtraBold"* ]]; then
    weight=800
  elif [[ $filename == *"SemiBold"* ]]; then
    weight=600
  elif [[ $filename == *"Bold"* ]]; then
    weight=700
  elif [[ $filename == *"Medium"* ]]; then
    weight=500
  elif [[ $filename == *"Regular"* ]]; then
    weight=400
  elif [[ $filename == *"ExtraLight"* ]]; then
    weight=200
  elif [[ $filename == *"Light"* ]]; then
    weight=300
  elif [[ $filename == *"Thin"* ]]; then
      weight=100
  fi
}

# Iterate through each folder in the root font directory
find $ROOT_FONT_DIR -mindepth 1 -maxdepth 1 -type d | while read FONT_DIR; do
  # Get the font family name from the folder name
  FONT_FAMILY=$(basename "$FONT_DIR")

  # Output file for the current font family
  OUTPUT_FILE="$FONT_DIR/fonts.txt"

  # Create the output file and write the header
  echo "Generating fonts YAML for $FONT_FAMILY..."
  echo "fonts:" > $OUTPUT_FILE
  echo "  - family: $FONT_FAMILY" >> $OUTPUT_FILE
  echo "    fonts:" >> $OUTPUT_FILE

  # Scan the directory for font files
  find $FONT_DIR -type f -name "*.ttf" | while read file; do
    # Remove leading "../../../" from file path
    cleaned_file=$(echo "$file" | sed 's#^\.\./\.\./\.\./##')
    # Extract the filename
    filename=$(basename "$cleaned_file")
    # Determine the style and weight
    get_style_and_weight "$filename"
    # Write the font details to the output file
    echo "      - asset: $cleaned_file" >> $OUTPUT_FILE
    echo "        style: $style" >> $OUTPUT_FILE
    echo "        weight: $weight" >> $OUTPUT_FILE
  done

  echo "YAML file generated at $OUTPUT_FILE"
done