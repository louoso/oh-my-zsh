#!/bin/bash

for name in '.zshrc'
do
  file="${HOME}/$name"
  if [ -h "$file" ]; then
    echo "removing symlink for $file"
    rm "$file"
  elif [ -f "$file" ]; then
    echo "moving $file to $file.bak"
    mv "$file" "$file.bak"
  elif [ -e "$file" ]; then
    echo "$file is not a file or a symlink"
  fi
  ln -s "${PWD}/$name" "$file"
done

ln -s "${PWD}" .oh-my-zsh
chsh -s $(which zsh)
