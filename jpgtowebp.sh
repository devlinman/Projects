for file in *.jpg
do
  mv "$file" "${file%.jpg}.webp"
done

## Place this file in a folder containing jpg files and it converts them into webp

## Can help rectify thumbnails for images transferred from mobile phone


# Improvements:
## using find command??
