#!/bin/bash
cd /mnt/d/Web/cron/scripts

API_URL="https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT"
OUTPUT_FILE="../data/btc_price.json"

curl -s $API_URL | jq '{price: .price}' > $OUTPUT_FILE