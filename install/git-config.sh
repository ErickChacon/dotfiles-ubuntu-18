#!/bin/sh

user=${1-"Erick Chacon"}
email=${2-"eral.th07@gmail.com"}

git config --global user.name $user
git config --global user.email $email
git config --global core.editor nvim
ssh-keygen -t rsa -b 4096 -C $email
ssh-add ~/.ssh/id_rsa

echo "Add the following ssh-key to github:"
cat ~/.ssh/id_rsa.pub
