#!/bin/bash
git config --global user.name "Umang-Sehgal"
git config --global user.email "umangsehgal50@gmail.com"
git config --global init.defaultBranch main

for dir in */;
do
  HF_REPO_NAME=${dir%%/}
  echo $HF_REPO_NAME         
            
  curl --location 'https://huggingface.co/api/repos/create' \
  --header 'Authorization: Bearer ${{ env.HF_TOKEN }}' \
  --header 'Content-Type: application/json' \
  --data '{
      "type": "model",
      "name": "'$HF_REPO_NAME'",
      "organization": "shellplc",
      "private":true
      }'
      
  cd $HF_REPO_NAME
  git init
  git remote add origin https://${{env.HF_USERNAME}}:${{env.HF_TOKEN}}@huggingface.co/shellplc/$HF_REPO_NAME
  git add .
  git commit -m "Contents from $HF_REPO_NAME github"
  git push --force -u origin main
  cd ..
done
