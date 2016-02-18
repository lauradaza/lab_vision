#!/bin/bash

declare -A array
shopt -s globstar

for file in **; do 
  [[ -f "$file" ]] || continue #when it finnish the infinite loop it moves on
  
  read cksm _ < <(md5sum "$file") 
  if ((array[$cksm]++)); then 
    echo "This file/files is duplicated $file"
  fi
done

#Based on http://superuser.com/questions/386199/how-to-remove-duplicated-files-in-a-directory
