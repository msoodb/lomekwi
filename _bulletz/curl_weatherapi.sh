#!/bin/bash


# https://www.weatherapi.com signup/in to get
# api key for calling and testing api.
# docs https://www.weatherapi.com/docs/



# Setup
RUN_ME=0

# LIVE environment Create API key
BASEAPI_URL="https://api.weatherapi.com/v1"
API_KEY="eeb797a976d94ddf8d394228201111"

# Current
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/current.json?key=$API_KEY&q=London" 
fi


# Forecast
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/forecast.json?key=$API_KEY&q=London&days=7"
fi


# Search
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/search.json?key=$API_KEY&q=Lond"
fi

# History
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/history.json?key=$API_KEY&q=London&dt=2010-01-01"
fi

# Astronomy
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/astronomy.json?key=$API_KEY&q=London"
fi

# Timezone
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/timezone.json?key=$API_KEY&q=London"
fi

# Sports
RUN_ME=1
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/sports.json?key=$API_KEY&q=London"
fi

