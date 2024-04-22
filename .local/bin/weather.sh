#!/bin/bash

WEATHER="${XDG_CACHE_HOME:-$HOME/.cache}/weather"
APIKEY=XXXXXXX

# Bearspaw, AB
LAT=51.14
LON=-114.31

curl -sf "https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${APIKEY}&units=metric" > $WEATHER || exit 1

CURRTEMP=$(jq -r '.main.temp' < $WEATHER)
HUMIDITY=$(jq -r '.main.humidity' < $WEATHER)
WCODE=$(jq -r '.weather[].id' < $WEATHER)
CURRTEMP=$(printf "%.1f" "${CURRTEMP}")

case $WCODE in
    2*)     ICON="󰖓" ;; # Thunderstorm
    3*)     ICON="󰖗" ;; # Drizzle
    5*)     ICON="󰖖" ;; # Rain
    6*)     ICON="󰖘" ;; # Snow
    7*)     ICON="󰖑" ;; # Atmosphere
    800)    ICON="󰖙" ;; # Clear
    80[12]) ICON="󰖕" ;; # Cloudy
    80[34]) ICON="󰖐" ;; # Overcast
esac

echo -e "${ICON}  ${CURRTEMP}C"
