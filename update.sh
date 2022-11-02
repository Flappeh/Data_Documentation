#!/bin/bash
echo "Starting ReadTheDocs Update Script"
read -p "Enter github commit message: " message
make.exe html
git init
git add .
git commit -m "$message"
git push
echo "Finished."