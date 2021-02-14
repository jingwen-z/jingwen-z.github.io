---
layout:             post
title:              "How to get places' reviews on Google Maps by Place API?"
date:               "2020-01-03 21:21:35 +0100"
last_modified_at:   2020-01-12 16:13:30 +0100
tags:               [python3, API]
comments:           true
excerpt:            >
    This blog talks about how to get places' reviews on Google Maps by
    different API and Python scripts, like Google Geocoding API, Place Search
    API and Place Details API.
cover:              /images/20200103-google-maps-reviews.jpg
img_width:          1280
img_height:         853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Imagine that you have a friend who recommend a restaurant to you, how will you
check its location and know if it's really good? Maybe Google Maps is a good
choice, since you can get its note and reviews given by clients. In this blog,
I'll talk about how to get the note and reviews for a batch of address by
Google Place API:
- What is Google Place API?
- How to get information by Google Place API?
- How to realise the request by Python?

## What is Google Place API?
The Places API is a service that returns information about places using HTTP
requests. Places are defined within this API as establishments, geographic
locations, or prominent points of interest.

The following place requests are available:
- [Place Search][place-search] returns a list of places based on a user's
location or search string.
- [Place Details][place-details] returns more detailed information about a
specific place, including user reviews.
- [Place Photos][place-photos] provides access to the millions of place-related
photos stored in Google's Place database.
- [Place Autocomplete][place-autocomplete] automatically fills in the name
and/or address of a place as users type.
- [Query Autocomplete][query-autocomplete] provides a query prediction service
for text-based geographic searches, returning suggested queries as users type.

## How to get information by Google Place API?
In order to get note and reviews by API, we need location's `place_id`. If you
don't have the information, we can search it by "Place Search" request or
"Geocoding API", then get reviews by "Place Details" request.

In the following, I will show how to get note and reviews by Google API. If you
have the `place_id`, you can jump to "Step 2".

### Step 1: If you have coordinates, we can get "place_id" by "Place Search"
The Places API lets you search for place information using a variety of
categories, including establishments, prominent points of interest, and
geographic locations. You can search for places either by proximity or a text
string. A Place Search returns a list of places along with summary information
about each place.

I prefer to search for places by proximity, since I assume that the coordinates
that I have might not be accurate. A Nearby Search lets you search for places
within a specified area. You can refine your search request by supplying
keywords or specifying the type of place you are searching for.

A Nearby Search request is an HTTP URL of the following form:

{% highlight python %}
https://maps.googleapis.com/maps/api/place/nearbysearch/output?parameters
{% endhighlight %}

where `output` may be either of the following values:
- `json` (recommended) indicates output in JavaScript Object Notation (JSON)
- `xml` indicates output as XML

Required parameters:
- `key` — Your application's API key. This key identifies your application.
- `location` — The latitude/longitude around which to retrieve place
information. This must be specified as latitude,longitude.
- `radius` — Defines the distance (in meters) within which to return place
results. The maximum allowed radius is 50 000 meters. Note that `radius` must
not be included if `rankby=distance` is specified.
- If `rankby=distance` is specified, then one or more of keyword, name, or type
is required.

Certain parameters are required to initiate a Nearby Search request. As is
standard in URLs, all parameters are separated using the ampersand (&)
character. About information of `parameters`, you can find [here][place-search].

**Example**

Imagine that I have the coordinates of one place, its latitude and longitude
are 48.830216 and 2.806147, respectively; I want to find the nearest location
whose name is "franprix". We can find its `place_id` with the following request:

{% highlight python %}
https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.830216,2.806147&rankby=distance&name=franprix&key=YOUR_API_KEY
{% endhighlight %}

then we can get the result in "json" format:

<p align="center">
  <img alt="Place Search result 1"
  src="{{ site.baseurl }}/images/20200103-place-search-1.png"/>
</p>
...
<p align="center">
  <img alt="Place Search result 2"
  src="{{ site.baseurl }}/images/20200103-place-search-2.png"/>
</p>

According to the result, we can get the correct coordinates, correct address,
global rating of location, total reviews' amount, the `place_id` and else. Once
we get the `place_id`, we can continue to step 2.

### Step 1 bis: If you have an address, we can get "place_id" by "Geocoding API"
Instead of coordinates, perhaps you have only address. In this case, we can
apply "Geocoding API" to get the `place_id`.

Geocoding is the process of converting addresses (like a street address) into
geographic coordinates (like latitude and longitude), which you can use to
place markers on a map, or position the map.

A Geocoding API request takes the following form:

{% highlight python %}
https://maps.googleapis.com/maps/api/geocode/outputFormat?parameters
{% endhighlight %}

where `outputFormat` may be either of the following values:
- `json` (recommended) indicates output in JavaScript Object Notation (JSON)
- `xml` indicates output in XML

About information of `parameters`, you can find [here][geocoding-api].

**Example**

Imagine that I have the address"1 Rue du Pré des Merlans, 77700
Bailly-Romainvilliers", we can find its `place_id` with the following request:

{% highlight python %}
https://maps.googleapis.com/maps/api/geocode/json?address=1%20Rue%20du%20Pre%20des%20Merlans,77700%20Bailly-Romainvilliers&&key=YOUR_API_KEY
{% endhighlight %}

then we can get the similar result as above, where we can find `place_id`.

### Step 2: If you have "place_id", we can get reviews by "Place Details"
Once you have a `place_id` from a Place Search, you can request more details
about a particular establishment or point of interest by initiating a Place
Details request. A Place Details request returns more comprehensive information
about the indicated place such as its complete address, phone number, user
rating and reviews.

A Place Details request is an HTTP URL of the following form:

{% highlight python %}
https://maps.googleapis.com/maps/api/place/details/output?parameters
{% endhighlight %}

where `output` may be either of the following values:
- `json` (recommended) indicates output in JavaScript Object Notation (JSON)
- `xml` indicates output as XML

Certain parameters are required to initiate a search request:
- `key` (required) — Your application's API key. This key identifies your
application for purposes of quota management.
- `place_id` (required) — A textual identifier that uniquely identifies a
place, returned from a Place Search.

About information of `parameters`, you can find [here][place-details].

**Example**

Now let's use the `place_id` that we found at the first step with the following
request:

{% highlight python %}
https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJ0_xvqWUD5kcRzKYnQQZJeZo&key=YOUR_API_KEY
{% endhighlight %}

then we can get the result in "json" format:

<p align="center">
  <img alt="Place Details result"
  src="{{ site.baseurl }}/images/20200103-place-details.png"/>
</p>

According to the result, we can get the time, note and text for each review. We
can get 5 reviews at most by "Place Details".

## How to realise the request by Python?
If you want to get requests' results by Python, we need to import `requests`
module and `urlencode` from `urllib.parse`, then you find 3 python functions
for the steps above in the following.

### Get "place_id" with coordinates
{% highlight python %}
import requests
from urllib.parse import urlencode

def search_place(gps, api_key):
    # Send request by API
    response = requests.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?' + urlencode(
            {'location': gps, 'rankby': 'distance', 'name': 'franprix', 'key': api_key}))
    # Read response as json
    resp_address = response.json()
    # status=OK: the place was successfully detected and at least one result was returned
    if resp_address['status'] == 'OK':
        lat = resp_address['results'][0]['geometry']['location']['lat']
        lng = resp_address['results'][0]['geometry']['location']['lng']
        vicinity_addr = resp_address['results'][0]['vicinity']
        place_id = resp_address['results'][0]['place_id']
        glb_rating = resp_address['results'][0]['rating']
        totnb_reviews = resp_address['results'][0]['user_ratings_total']
        return [lat, lng, vicinity_addr, place_id, glb_rating, totnb_reviews]
    else:
        print('Failed to get json response:', resp_address)
        return ['place_id is not found', gps]

{% endhighlight %}

### Get "place_id" with address
{% highlight python %}
import requests
from urllib.parse import urlencode

def geocode(address, api_key):
    # Send request by API
    response = requests.get(
        'https://maps.googleapis.com/maps/api/geocode/json?' + urlencode(
            {'address': address, 'key': api_key, 'sensor': 'false'}))
    # Read response as json
    resp_address = response.json()
    # status=OK: the place was successfully detected and at least one result was returned
    if resp_address['status'] == 'OK':
        lat = resp_address['results'][0]['geometry']['location']['lat']
        lng = resp_address['results'][0]['geometry']['location']['lng']
        formatted_addr = resp_address['results'][0]['formatted_address']
        return [lat, lng, formatted_addr]
    else:
        print('Failed to get json response:', resp_address)
        return ['Latitude is not found', 'Longitude is not found', address]
{% endhighlight %}

### Get reviews with "place_id"
{% highlight python %}
import requests
from urllib.parse import urlencode

def get_place_details(place_id, api_key):
    # Send request by API
    response = requests.get(
        'https://maps.googleapis.com/maps/api/place/details/json?' + urlencode(
            {'place_id': place_id, 'key': api_key}))
    # Read response as json
    resp_details = response.json()
    # status=OK: the place was successfully detected and at least one result was returned
    for i in range(len(resp_details)):

    if resp_details['status'] == 'OK':
        for i in range(len(resp_details)):
            review_rating = resp_details['result']['reviews'][i]['rating']
            review_time = resp_details['result']['reviews'][i]['relative_time_description']
            review_timestamp = resp_details['result']['reviews'][i]['time']
            review_text = resp_details['result']['reviews'][i]['text']
            return [place_id, review_rating, review_time, review_timestamp, review_text]
    else:
        print('Failed to get json response:', resp_details)
        return ['Review is not found', place_id]
{% endhighlight %}

## Reference
- "Places API", _developers.google.com_. [Online]. Available: [https://developers.google.com/places/web-service/intro][place-api]
- "Place Search", _developers.google.com_. [Online]. Available: [https://developers.google.com/places/web-service/search][place-search]
- "Place Details", _developers.google.com_. [Online]. Available: [https://developers.google.com/places/web-service/details][place-details]
- "Geocoding API", _developers.google.com_. [Online]. Available: [https://developers.google.com/maps/documentation/geocoding/start][geocoding-api]
- henry perks, "BJXAxQ1L7dI", _unsplash.com_. [Online]. Available: [https://unsplash.com/photos/BJXAxQ1L7dI][image]

[place-api]: https://developers.google.com/places/web-service/intro
[place-search]: https://developers.google.com/places/web-service/search
[place-details]: https://developers.google.com/places/web-service/details
[place-photos]: https://developers.google.com/places/web-service/photos
[place-autocomplete]: https://developers.google.com/places/web-service/autocomplete
[query-autocomplete]: https://developers.google.com/places/web-service/query
[geocoding-api]: https://developers.google.com/maps/documentation/geocoding/start
[image]: https://unsplash.com/photos/BJXAxQ1L7dI
