#!/bin/sh

docker run --rm --network="host" \
  -v $(pwd)/request.lua:/data/request.lua \
  -e METHOD=PUT \
  haydenjeune/wrk2:latest \
  -t1 -c1 -R200 -d30s --latency -s /data/request.lua \
  http://localhost:8080 > put_results.txt

docker run --rm --network="host" \
  -v $(pwd)/request.lua:/data/request.lua \
  -e METHOD=GET \
  haydenjeune/wrk2:latest \
  -t1 -c1 -R200 -d30s --latency -s /data/request.lua \
  http://localhost:8080 > get_results.txt
