#!/bin/sh
# shellcheck disable=SC1083
# shellcheck disable=SC2086

# A dwm_bar function that shows the btc perp last price on binance
# antx-code <wkaifeng2007@163.com>
# GNU GPLv3

# Last price is formatted like like this: "[₿ 20890.8]"

binance_kline="https://dapi.binance.com/dapi/v1/ticker/24hr?symbol=BTCUSD_PERP"
btc_icon="₿"
PRICE_SCALE=1
PROXY_PORT=7890

# Outputs BTC price on dwm status bar
dwm_binance() {
    if [ "$(check_http_code)" -eq "405" ]; then
        btc_last_price=$(get_last_price)
    elif [ "$(check_http_code true)" -eq "405" ]; then
        btc_last_price=$(get_last_price true)
    else
        printf "NError"
    fi
    # Format output
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "$btc_icon %s" "$btc_last_price"
    else
        printf "BTC %s" "$btc_last_price"
    fi
    printf "%s\n" "$SEP2"
}


execute_curl() {
    use_proxy=${1:-false}
    proxy_cmd=$(echo "$use_proxy" | grep -iq "true" && echo "--proxy http://127.0.0.1:$PROXY_PORT")
    cmd="$2"
    curl_cmd="curl $proxy_cmd $cmd \"$binance_kline\""
    echo "$curl_cmd"
}

check_http_code() {
    curl_cmd="-I -m 10 -o /dev/null -s -w %{http_code}"
    request_cmd=$(execute_curl "$1" "$curl_cmd")
    response=$(eval $request_cmd)
    echo $response
}

get_last_price() {
    curl_cmd="-v --stderr -"
    request_cmd=$(execute_curl "$1" "$curl_cmd")
    last=$(eval $request_cmd | grep -oP '(?<="lastPrice":")[^"]*')
    btc_last_price=$(awk -v x=$PRICE_SCALE -v y=$last 'BEGIN{printf "%.2f\n",x*y}')
    echo $btc_last_price
}

dwm_binance