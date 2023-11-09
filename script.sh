#!/bin/bash

for dir in */;
do
          curl --location 'https://huggingface.co/api/repos/create' \
          --header 'Authorization: Bearer ${{ env.HF_TOKEN }}' \
          --header 'Content-Type: application/json' \
          --data '{
            "type": "model",
            "name": "$dir",
            "organization": "shellplc",
            "private":true
          }'
          git push --force https://$HF_USERNAME:$HF_TOKEN@huggingface.co/shellplc/$dir main/$dir 
#    echo $dir
done
