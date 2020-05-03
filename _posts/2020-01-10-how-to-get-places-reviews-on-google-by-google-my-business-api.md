---
layout:      post
title:       "How to get places' reviews on Google by Google My Business API?"
date:        "2020-01-10 21:40:42 +0100"
tags:        [python3, API]
comments:    true
excerpt:     >
    In the last blog, I talked about how to get places' reviews on Google by
    Place API, but we can get only 5 reviews at most by “Place Details”. If you
    want to extract all reviews of each location, you can use "Google My
    Business API". In this blog, I will talk about how to get places' reviews
    on Google by Google My Business API
img_url:     /images/20200103-google-maps-reviews.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="Google Maps Review"
  src="{{ site.baseurl }}/images/20200103-google-maps-reviews.jpg"/>
</p>

In the [last blog][place-api], I talked about how to get places' reviews on
Google by Place API, but we can get only 5 reviews at most by “Place Details”.
If you want to extract all reviews of each location, you can use "Google My
Business API". In this blog, I will talk about how to get places' reviews on
Google by Google My Business API with the following points:
- What is Google My Business (GMB)?
- Prerequisites
- Using OAuth 2.0 to Access Google APIs
- How to perform OAuth 2.0 using the Curl CLI?
- How to get information by Google My Business API?
- How to realise the request by Python?

## What is Google My Business (GMB)?
Google My Business is an Internet-based service for business owners which is
operated by Google. The network launched in June 2014 as a way of giving
business owners more control of what shows up in the search results when someone
searches a given business name.

## Prerequisites
Before starting, you should complete these [prerequisites][gmb-prerequisites].
After completing them, you can [enable the Google My Business API]
[enable-gmb-api], [request an OAuth 2.0 client ID][request-oauth]; then you can
[test your API with OAuth 2.0 Playground][test-api].

## Using OAuth 2.0 to Access Google APIs
Concerning how to use OAuth 2.0 to access Google APIs, we can summarize as the
following four points:
- Obtain OAuth 2.0 credentials from the Google API Console.
- Obtain an access token from the Google Authorization Server.
- Send the access token to an API.
- Refresh the access token, if necessary.

<p align="center">
  <img alt="Using OAuth 2.0 to Access Google APIs"
  src="{{ site.baseurl }}/images/20200110-oath2.0.png"/>
</p>

The authorization sequence begins when your application redirects a browser to a
Google URL; the URL includes query parameters that indicate the type of access
being requested. Google handles the user authentication, session selection, and
user consent. The result is an authorization code, which the application can
exchange for an access token and a refresh token.

The application should store the refresh token for future use and use the access
token to access a Google API. Once the access token expires, the application
uses the refresh token to obtain a new one.

## How to perform OAuth 2.0 using the Curl CLI?
Now we understand how to access Google APIs with OAuth 2.0, let's see how to
perform its logic by curl. Inspired by [John Hanley's blog][oauth-url-blog],
we have the following ways for Windows Command Prompt users but should be
easily adaptable to Linux and Mac also.

In the following example, the Scope is `business.manage`. Modify to use the
scopes that you want to test with.

Steps:
- Copy the following statements to a Windows batch file.
- Modify to fit your environment.
- Modify the script for the browser that you want to use.
- Run the batch file.
- A browser will be launched.
- The browser will go to [https://developers.google.com/oauthplayground]
[oauthplayground-url] where you can complete the Google OAuth 2.0 authentication.
- Once complete a code will be displayed in the browser window.
- Copy this code from the browser window and paste into the command prompt
window.
- The script will complete the OAuth 2.0 code exchange for a Token.
- The Token will be displayed in the command prompt.
- The returned Token contains an Access Token that can be used in more curl commands.

{% highlight bash %}
set CLIENT_ID=your_client_id
set CLIENT_SECRET=your_client_secret
set SCOPE=https://www.googleapis.com/auth/business.manage
set ENDPOINT=https://accounts.google.com/o/oauth2/v2/auth
set REDIRECT_URI=https://developers.google.com/oauthplayground

set URL="%ENDPOINT%?client_id=%CLIENT_ID%&response_type=code&scope=%SCOPE%&access_type=offline&redirect_uri=%REDIRECT_URI%"

@REM start iexplore %URL%
@REM start microsoft-edge:%URL%
start chrome %URL%

set /p AUTH_CODE=""

curl ^
--data client_id=%CLIENT_ID% ^
--data client_secret=%CLIENT_SECRET% ^
--data code=%AUTH_CODE% ^
--data redirect_uri=%REDIRECT_URI% ^
--data grant_type=authorization_code ^
https://www.googleapis.com/oauth2/v4/token
{% endhighlight %}

The output looks like this:

{% highlight bash %}
{
  "access_token": "ya29.deleted_for_security_reasons",
  "expires_in": 3600,
  "scope": "https://www.googleapis.com/auth/business.manage",
  "token_type": "Bearer"
}
{% endhighlight %}

I copied `access_token`'s value and saved it in a `.properties` file.

## How to get information by Google My Business API?
With `access_token`, we can finally send our requests by GMB API. In my case,
I need to extract clients' reviews for each location; in order to achieve it,
we firstly need `accounts` data and `locations` data with the following steps:
- Get `accounts` data
- Get `locations` data with `accounts` data
- Get `reviews` data with `locations` data

### Get "accounts" data
In the first step, we need to get the specified account with HTTP request:

{% highlight bash %}
GET https://mybusiness.googleapis.com/v4/{name=accounts/*}
{% endhighlight %}

The output should be similar as:

{% highlight bash %}
{
  "name": string,
  "accountName": string,
  "type": enum (AccountType),
  "role": enum (AccountRole),
  "state": {
    object (AccountState)
  },
  "profilePhotoUrl": string,
  "accountNumber": string,
  "permissionLevel": enum (PermissionLevel),
  "organizationInfo": {
    object (OrganizationInfo)
  }
}
{% endhighlight %}

What we need is the value of `name`, it's like "accounts/0123456789".

### Get "locations" data with "accounts" data
With the value of `accounts`, now we can extract the locations which are
contained in the account with HTTP request.

{% highlight bash %}
GET https://mybusiness.googleapis.com/v4/{name=accounts/*/locations/*}
{% endhighlight %}

The output should be similar as:

{% highlight bash %}
{
  "name": string,
  "languageCode": string,
  "storeCode": string,
  "locationName": string,
  "primaryPhone": string,
  "additionalPhones": [
    string
  ],
  "address": {
    object (PostalAddress)
  },
  "primaryCategory": {
    object (Category)
  },
  "additionalCategories": [
    {
      object (Category)
    }
  ],
  "websiteUrl": string,
  "regularHours": {
    object (BusinessHours)
  },
  "specialHours": {
    object (SpecialHours)
  },
  "serviceArea": {
    object (ServiceAreaBusiness)
  },
  "locationKey": {
    object (LocationKey)
  },
  "labels": [
    string
  ],
  "adWordsLocationExtensions": {
    object (AdWordsLocationExtensions)
  },
  "latlng": {
    object (LatLng)
  },
  "openInfo": {
    object (OpenInfo)
  },
  "locationState": {
    object (LocationState)
  },
  "attributes": [
    {
      object (Attribute)
    }
  ],
  "metadata": {
    object (Metadata)
  },
  "priceLists": [
    {
      object (PriceList)
    }
  ],
  "profile": {
    object (Profile)
  },
  "relationshipData": {
    object (RelationshipData)
  }
}
{% endhighlight %}

What we need is the value of `name`, it's like
"accounts/0123456789/locations/9876543210".

By the way, we can get only 100 locations as most per request. If it has more
than 100 locations, it will return a `nextPageToken` as well to extract other
locations. However, it seems that [it doesn't work properly][nextpagetoken-bug],
so we can send the request with the `postal_code` filter, like
`?filter=address.postal_code="75014"`, then we can get all locations of quarter
"75014".

### Get "reviews" data with "locations" data
With the value of `locations`, now we can extract the their reviews and notes
with HTTP request.

{% highlight bash %}
GET https://mybusiness.googleapis.com/v4/{name=accounts/*/locations/*/reviews/*}
{% endhighlight %}

The output should be similar as:

{% highlight bash %}
{
  "name": string,
  "reviewId": string,
  "reviewer": {
    object (Reviewer)
  },
  "starRating": enum (StarRating),
  "comment": string,
  "createTime": string,
  "updateTime": string,
  "reviewReply": {
    object (ReviewReply)
  }
}
{% endhighlight %}

What we need is the value of `starRating` and `comment`, the value of
`starRating` is one of "ONE", "TWO", "THREE", "FOUR" and "FIVE".

## How to realise the request by Python?
If you want to achieve the extraction above by Python, we need to import
`requests` module, then create a dictionary to specify the HTTP headers before
sending requests by Python.

{% highlight python %}
HEADERS = {'Client_id': 'value_of_client_id',
           'Client_secret': 'value_of_client_secret',
           'Authorization': 'Bearer ' + 'ya29.deleted_for_security_reasons'}
{% endhighlight %}

### Get "accounts" data

{% highlight python %}
import requests

def search_accounts():
    response = requests.get('https://mybusiness.googleapis.com/v4/accounts/',
                            headers=HEADERS)
    resp = response.json()

    # status_code=200: the place was successfully detected and at least one result was returned
    if response.status_code == 200:
        for i in range(len(resp['accounts'])):
            name = resp['accounts'][i]['name']
            account_name = resp['accounts'][i]['accountName']
        return name, account_name
    else:
        print('Failed to get json response:', resp)
        return 'name is not found', 'accountName is not found'
{% endhighlight %}

What we need is the value of `name`, it's like "accounts/0123456789".

### Get "locations" data with "accounts" data

{% highlight python %}
import requests

def search_locations(accounts, cp):
    response = requests.get('https://mybusiness.googleapis.com/v4/' + accounts + '/locations?filter=address.postal_code=' + cp,
                            headers=HEADERS)
    resp = response.json()

    # status_code=200: the place was successfully detected and at least one result was returned
    if response.status_code == 200 and len(resp) > 0:
        for i in range(len(resp['locations'])):
            loc_name = resp['locations'][i]['name']
            store_code = resp['locations'][i]['storeCode']
            
            if 'latlng' in resp['locations'][i] and \
            'latitude' in resp['locations'][i]['latlng']:
                latitude = resp['locations'][i]['latlng']['latitude']

            if 'latlng' in resp['locations'][i] and \
            'longitude' in resp['locations'][i]['latlng']:
                longitude = resp['locations'][i]['latlng']['longitude']
            
            if 'address' in resp['locations'][i]:
                if 'postalCode' in resp['locations'][i]['address']:
                    postalCode = resp['locations'][i]['address']['postalCode']
                if 'locality' in resp['locations'][i]['address']:
                    locality = resp['locations'][i]['address']['locality']
                if 'addressLines' in resp['locations'][i]['address']:
                    addressLines = resp['locations'][i]['address']['addressLines'][0]

            if 'locationKey' in resp['locations'][i] and \
            'placeId' in resp['locations'][i]['locationKey']:
                place_id = resp['locations'][i]['locationKey']['placeId']
            return loc_name, store_code, latitude, longitude, postalCode, locality, addressLines
    else:
        print('Failed to get json response:', resp, cp)
{% endhighlight %}

We assign "accounts/0123456789" as input `accounts` of `search_locations()`,
then we will get locations' information.

### Get "reviews" data with "locations" data

{% highlight python %}
import requests

def search_reviews(locations):
    response = requests.get('https://mybusiness.googleapis.com/v4/' + locations + '/reviews',
                            headers=HEADERS)

    resp = response.json()

    # status_code=200: the place was successfully detected and at least one result was returned
    if response.status_code == 200 and len(resp) > 0:
        for i in range(len(resp['reviews'])):
            loc_name = locations
            reviewId = resp['reviews'][i]['reviewId']
            createTime = resp['reviews'][i]['createTime']
            updateTime = resp['reviews'][i]['updateTime']
            
            if 'starRating' in resp['reviews'][i]:
                starRating = resp['reviews'][i]['starRating']
            if 'comment' in resp['reviews'][i]:
                comment = resp['reviews'][i]['comment']
            return loc_name, reviewId, createTime, updateTime, starRating, comment
    else:
        print('Failed to get json response:', resp)
{% endhighlight %}

## Reference
- "Google My Business", _www.google.com_. [Online]. Available: [https://www.google.com/intl/en_us/business/][gmb]
- "Google My Business API", _www.google.com_. [Online]. Available: [https://developers.google.com/my-business/content/overview][gmb-api]
- "Google My Business API Reference", _www.google.com_. [Online]. Available: [https://developers.google.com/my-business/reference/rest][gmb-api-reference]
- "Reviews API (nextPageToken) not working properly ", _support.google.com_. [Online]. Available: [https://support.google.com/business/thread/2096654?hl=en][nextpagetoken-bug]

[place-api]: https://jingwen-z.github.io/how-to-get-places-reviews-on-google-maps-by-place-api/
[gmb]: https://www.google.com/intl/en_us/business/
[gmb-api]: https://developers.google.com/my-business/content/overview
[gmb-api-reference]: https://developers.google.com/my-business/reference/rest
[gmb-prerequisites]: https://developers.google.com/my-business/content/prereqs
[enable-gmb-api]: https://developers.google.com/my-business/content/basic-setup#enable-the-api
[request-oauth]: https://developers.google.com/my-business/content/basic-setup#request-client-id
[test-api]: https://developers.google.com/my-business/content/basic-setup#make-simple-http-request
[oauth-url-blog]: https://www.jhanley.com/google-oauth-2-0-testing-with-curl/
[oauthplayground-url]: https://developers.google.com/oauthplayground
[nextpagetoken-bug]: https://support.google.com/business/thread/2096654?hl=en
