# Create a file to hold the most recent tree output if it doesn't already exist
if ! [ -e ~/.differ ]
then
  echo "Creating temp diff file in ~/.differ - this will only happen once"
  touch ~/.differ
fi

#  Capture the current tree into a temp file
tree > ~/.differ_temp

if diff -q ~/.differ ~/.differ_temp > /dev/null ; then
  # If no changes, don't do anything
  echo "No changes detected"
else
  # If changes, show side by side
  echo "Changes:\n"
  diff -yTt ~/.differ ~/.differ_temp
fi

# Clean up the temp file
mv ~/.differ_temp ~/.differ

echo -e "\e[1;31m This is red text \e[0m"
