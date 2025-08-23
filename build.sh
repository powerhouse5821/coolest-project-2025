#!/bin/bash

echo "Clearing the Directory Export" 

rm -Rf dist
# Create the dist directory if it doesn't exist
mkdir -p dist
mkdir -p dist/html/
mkdir -p dist/android/
mkdir -p dist/linux

# Build for Android (APK)
# godot --export-debug "Android" dist/android/game.apk

# Build for HTML5
godot --display-driver headless  --export-release "HTML" dist/html/index.html

# Build for Linux
# godot --export-release "Linux" dist/linux/game.x86_64

# Add dist to .gitignore
# echo "dist" >> .gitignore

echo "Build complete! The output files are in the 'dist' directory."

docker build -t coolest-project-ever-2025 .
