#!/bin/bash

# list all files in each forlder in this current directory

for folder in $(ls); do for file in $folder/*; do echo $file; done; done

echo $'\n'

for file in ./*; do echo $file; done

