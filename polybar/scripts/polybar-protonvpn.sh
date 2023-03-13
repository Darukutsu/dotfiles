#!/bin/bash
COLOR_CONNECTED='#8ABEB7' 
COLOR_DISCONNECTED='#0f0'
ICON_CONNECTED=
ICON_DISCONNECTED=
INTERVAL=5
PRINT_VALUES=("ip" "server" "contime")

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function array_contains () { 
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == "$seeking" ]]; then
            in=0
            break
        fi
    done
    return $in
}

function connect_vpn () {
    protonvpn-cli c -f
}

function disconnect_vpn () {
    protonvpn-cli d
}

function is_vpn_connected () {
    status=`protonvpn-cli s | grep IP:`
    if [ -z "$status" ]; then
        echo 0
    else
        echo 1
    fi
}

function toggle_vpn () {
    connected=`is_vpn_connected`
    if [[ $connected -eq 0 ]]; then
        connect_vpn
    else
        disconnect_vpn
    fi
}

function output () {
    out=""
    connected=`is_vpn_connected`
    if [[ $connected -eq 1 ]]; then
        prints=()
        status="protonvpn-cli s"
        array_contains PRINT_VALUES "ip" && prints+=(`$status | grep IP: | awk '{ print $2 }'`)
        array_contains PRINT_VALUES "server" && prints+=(`$status | grep Server: | awk '{ print $2 }'`)
        array_contains PRINT_VALUES "contime" && prints+=(`$status | grep "Connection time": | awk '{ print $3 }'`)
        size=${#prints[@]}
        out="%{F$COLOR_CONNECTED}$ICON_CONNECTED%{F-} "
        ts=`date +%s`
        a=`expr $size \* $INTERVAL`
        b=`expr $ts % $a`
        c=`expr $b / $INTERVAL`
        out+=${prints[$c]}
        echo "%{A1:$DIR/polybar-protonvpn -t:}$out%{A}"
    else
        echo ""
        #out="%{F$COLOR_DISCONNECTED}$ICON_DISCONNECTED Disconnected%{F-}"
        #out=""
    fi
}
while getopts 'ot' c
do
    case $c in
        o) output ;;
        t) toggle_vpn ;;
    esac
done
