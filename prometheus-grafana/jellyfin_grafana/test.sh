TOKEN=187f26bdb1cb495c876ab03c96550c5b
BASE_URL=http://192.168.100.16:8096

curl -X "GET" \
  "$BASE_URL/Sessions" \
  -H "Authorization: MediaBrowser Token=$TOKEN" |
  jq '.[]'