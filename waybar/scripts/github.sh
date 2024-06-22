#!/bin/bash

token=${GITHUB_ACCESS_TOKEN}
count=$(curl -u Darukutsu:${token} https://api.github.com/notifications | jq '. | length')

if [[ "$count" != "0" ]]; then
  echo '{"text":'$count',"tooltip":"$tooltip","class":"$class"}'
fi
