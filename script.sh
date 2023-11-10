#!/bin/bash
git config --global user.name "Umang-Sehgal"
git config --global user.email "umangsehgal50@gmail.com"
git config --global init.defaultBranch main

for dir in */;
do
          curl --location 'https://huggingface.co/api/repos/create' \
          --header 'Authorization: Bearer ${{ env.HF_TOKEN }}' \
          --header 'Content-Type: application/json' \
          --data '{
            "type": "model",
            "name": "${{env.dir}}",
            "organization": "shellplc",
            "private":true
          }'

          cd $dir
          git init
          git remote add origin https://$HF_USERNAME:$HF_TOKEN@huggingface.co/shellplc/$dir
          git add .
          git commit -m "Contents from $dir github"
          git push --force -u origin main
done
