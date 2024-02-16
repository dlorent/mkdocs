#!/bin/bash
GIT_URL="${GIT_URL:-github.com}"
GIT_REPO="${GIT_REPO:-dlorent/mkdocs}"
GIT_USER="${GIT_USER:-github@lorentsen.nu}"
GIT_PASS="${GIT_PASS:-admin}"
GIT_AUTH="${GIT_AUTH:-true}"
USER_UID="${USER_UID:-1000}"

STORAGE="${STORAGE:-/storage}"

echo "=== DEBUG & Avaiable Variables==="
echo "GIT_URL: $GIT_URL"
echo "GIT_REPO: $GIT_REPO"
echo "GIT_USER: $GIT_USER"
echo "GIT_AUTH: $GIT_AUTH"
echo "GIT_PASS: ********"
echo "USER_UID: $USER_UID"

[ ! -d $STORAGE ] && mkdir -p $STORAGE


cd $STORAGE

if [ $GIT_AUTH == "true" ]
then
  git clone https://$GIT_USER:$GIT_PASS@$GIT_URL/$GIT_REPO .
else
  git clone https://$GIT_URL/$GIT_REPO .
fi


echo
echo "--- Setting permissions"
chown -R $USER_UID:$USER_UID $STORAGE

ls -la $STORAGE
echo "Container Done"

