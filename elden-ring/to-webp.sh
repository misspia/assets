#! /bin/bash

# The path to search
search_dir = "./weapons-raw"

# Search the directory above, and it's sub-directories, for any file which has the file extension: [.jpg, .jpeg, .png]
for f in $(find $search_dir -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \))
do
  # Print the image filename
  echo "Got Image: $f"
  # Create a variable for the new filename (e.g. if jpeg = image1.jpeg, "NEW_FILE" will be image1.webp)
  NEW_FILE="${f%.*}.webp"
  # Convert the image, passing in the current image filename, and the output destination ($NEW_FILE)
  cwebp -q 75 $f -o $NEW_FILE
  # Delete the original image
  rm $f
done

# source:
# https://ryansouthgate.com/optimising-images-for-the-web/
