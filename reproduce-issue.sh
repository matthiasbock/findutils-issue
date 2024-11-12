#/bin/bash

set -x

apt show findutils
which find
find --version

mkdir -p test
cd test

# Create some test files
touch test.zip test.rar test.pdf .hidden.zip .hidden.rar .hidden.pdf

# Run find with -print/-print0 before the parentheses
find . -maxdepth 1 -type f \( -iname \*.zip -o -iname \*.rar \) -print
echo
find . -maxdepth 1 -type f \( -iname \*.zip -o -iname \*.rar \) -print0
echo

# Run find with -print/-print0 after the parentheses
find . -maxdepth 1 -type f -print \( -iname \*.zip -o -iname \*.rar \)
echo
find . -maxdepth 1 -type f -print0 \( -iname \*.zip -o -iname \*.rar \)
echo

# Run find with -print/-print0 and excluding hidden files
find . -maxdepth 1 -type f -not -path '*/.*' -print \( -iname \*.zip -o -iname \*.rar \)
echo
find . -maxdepth 1 -type f -not -path '*/.*' -print0 \( -iname \*.zip -o -iname \*.rar \)
echo

set +x
# Clean up
cd ..
rm -r test

