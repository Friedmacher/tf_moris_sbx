#!/bin/sh
set -e

# Define the file names
TARGET_FILE=".devcontainer/devcontainer.env"
EXAMPLE_FILE=".devcontainer/devcontainer.env.example"

# Check if the target file does not exist
if [ ! -f "$TARGET_FILE" ]; then
    # Check if the example file actually exists before copying
    if [ -f "$EXAMPLE_FILE" ]; then
        cp "$EXAMPLE_FILE" "$TARGET_FILE"
        echo "✅ Success: Created $TARGET_FILE from $EXAMPLE_FILE."
    else
        echo "Error: $EXAMPLE_FILE does not exist. Cannot copy."
        exit 1
    fi
else
    echo "⚠️ Notice: $TARGET_FILE already exists. No action taken."
fi

echo ""
echo "✅ Root setup complete."
