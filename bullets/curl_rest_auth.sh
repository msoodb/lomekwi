#!/bin/bash

RUN_ME=0


# -Basic Authentication : Atlassian
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    BASE_URL="https://saashop.atlassian.net/rest/api"
    API_VERSION="/2"
    USER=""
    API_TOKEN=""
    BASIC_AUTH=$(echo -n $USER:$API_TOKEN | base64 -w 0)

    # header 
    curl --location --request GET --verbose \
	 --url "$BASE_URL/$API_VERSION/issue/SA-64" \
     	 --header "Authorization: Basic $BASIC_AUTH" \
	 --header "Content-Type: application/json" | json_reformat
    # --user "$USER:$API_TOKEN"
fi

# -Bearer Authentication : PayPal
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    BASE_URL="https://api-m.sandbox.paypal.com"
    CLIENT_ID=''
    SECRET=''
    BASIC_AUTH=$(echo -ne $CLIENT_ID:$SECRET | base64 -w 0)

    # get access token via basic authentication
    curl --location --request POST --verbose \
	 --url "$BASE_URL/v1/oauth2/token" \
    	 --header "Accept: application/json" \
    	 --header "Accept-Language: en_US" \
    	 --header "Authorization: Basic $BASIC_AUTH" \
    	 --data "grant_type=client_credentials"
    # --user "$CLIENT_ID:$SECRET"
    ACCESS_TOKEN=""

    # use access token via bearer authentication
    curl --location --request POST --verbose \
	 --url "$BASE_URL/v2/invoicing/generate-next-invoice-number" \
	 --header "Content-Type: application/json" \
	 --header "Authorization: Bearer $ACCESS_TOKEN"
fi


# -API Key : weatherapi, skyscanner
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    BASEAPI_URL="https://api.weatherapi.com/v1"
    API_KEY=""

    curl --location --request GET --verbose \
	 --url "$BASEAPI_URL/current.json?key=$API_KEY&q=London" 
fi

RUN_ME=1
if [ $RUN_ME = 1 ]
then
    BASEAPI_URL="https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices"
    API_HOST=""
    API_KEY=""

   curl --request GET \
	--url "$BASEAPI_URL/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2020-12-15?inboundpartialdate=2020-12-01" \
	--header "x-rapidapi-host: $API_HOST" \
	--header "x-rapidapi-key: $API_KEY"
fi

# OAuth 2.0 Authentication : Google
