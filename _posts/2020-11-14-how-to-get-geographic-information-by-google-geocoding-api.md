---
layout:      post
title:       "How to get geographic information by Google Geocoding API?"
date:        "2020-11-14 17:14:22 +0100"
tags:        [python3, API]
comments:    true
excerpt:     >
    In this blog, I presented how to get coordinates and address by Google
    Geocoding API, and how to accomplish it by Python.
cover:       /images/20201114-map-image.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Imagine that you want to draw some geographic points on a map, you only have
their addresses, how to get their latitude and longitude? As a data scientist,
we can find them by Google Geocoding API. In this blog, I'll talk about Google
Geocoding API with the following points:
- What is Google Geocoding API?
- How to get information by Google Geocoding API?
- How to accomplish the request by Python?

## What is Google Geocoding API?
Geocoding is the process of converting addresses (like "1600 Amphitheatre
Parkway, Mountain View, CA") into geographic coordinates (like latitude
37.423021 and longitude -122.083739), which you can use to place markers on a
map, or position the map. Reverse geocoding is the process of converting
geographic coordinates into a human-readable address.

The Geocoding API provides a direct way to access these services via an HTTP
request.

## How to get information by Google Geocoding API?
### Geocoding
A Geocoding API request takes the following form:

{% highlight python %}
https://maps.googleapis.com/maps/api/geocode/outputFormat?parameters
{% endhighlight %}

where outputFormat may be either of the following values:
- `json` (recommended) indicates output in JavaScript Object Notation (JSON)
- `xml` indicates output in XML

Required parameters in a geocoding request:
- `address`: The street address or plus code that you want to geocode.
- `key`: Your application's API key. This key identifies your application for
purposes of quota management.

**Example**

Imagine that we have an address "52 Rue Rambuteau, 75003 Paris" and want its
coordinates, we can write the request as follows:

{% highlight python %}
https://maps.googleapis.com/maps/api/geocode/json?address=52%20Rue%20Rambuteau%2075003%20Paris&key=YOUR_API_KEY
{% endhighlight %}

then we can get the result in “json” format:

<p align="center">
  <img alt="20201114-resp-address"
  src="{{ site.baseurl }}/images/20201114-resp-address.png"/>
</p>

According to the result, we get the latitude and longitude, and the formatted
address as well.

### Reverse geocoding
Sometimes we need the address or zip code but have only the coordinates, in this
case, we can do reverse geocoding to get the address.

The term geocoding generally refers to translating a human-readable address into
a location on a map. The process of doing the opposite, translating a location
on the map into a human-readable address, is known as reverse geocoding.

Required parameters in a reverse geocoding request:
- `latlng`: The latitude and longitude values specifying the location for which
you wish to obtain the closest, human-readable address.
- `key`: Your application's API key. This key identifies your application for
purposes of quota management.

**Example**

Imagine that we have a latitude 48.871143, a longitude 2.332060 and want its
address, we can write the request as follows:

{% highlight python %}
https://maps.googleapis.com/maps/api/geocode/json?latlng=48.871143,2.332060&key=YOUR_API_KEY
{% endhighlight %}

then we can get the result in “json” format:

<p align="center">
  <img alt="20201114-resp-coordinates-1"
  src="{{ site.baseurl }}/images/20201114-resp-coordinates-1.png"/>
</p>
...
<p align="center">
  <img alt="20201114-resp-coordinates-2"
  src="{{ site.baseurl }}/images/20201114-resp-coordinates-2.png"/>
</p>

According to the result, we get the formatted address.

## How to accomplish the request by Python?
If you want to get requests' results by Python, we need to import `requests`
module and `urlencode` from `urllib.parse`, then you find the python functions
for the cases above in the following.

### Geocoding
{% highlight python %}
import requests
from urllib.parse import urlencode

def get_coordinates(adr, key=key):
    # Send request by API
    response = requests.get(
        'https://maps.googleapis.com/maps/api/geocode/json?' + urlencode(
            {'address': adr, 'key': key}))
    # Read response as json
    resp_address = response.json()
    
    # status=OK: the place was successfully detected and
    # at least one result was returned
    if resp_address['status'] == 'OK':
        lat = resp_address['results'][0]['geometry']['location']['lat']
        lng = resp_address['results'][0]['geometry']['location']['lng']
        formatted_addr = resp_address['results'][0]['formatted_address']
        return [lat, lng, formatted_addr]
    else:
        print('Failed to get json response:', resp_address)
        return ['Latitude is not found', 'Longitude is not found', address]
{% endhighlight %}

<p align="center">
  <img alt="20201114-get-coordinates-result"
  src="{{ site.baseurl }}/images/20201114-get-coordinates-result.png"/>
</p>

### Reverse geocoding
{% highlight python %}
import requests
from urllib.parse import urlencode

def get_address(lat, lng, key=key):
    response = requests.get(
        'https://maps.googleapis.com/maps/api/geocode/json?' + urlencode(
            {'latlng': str(lat) + ',' + str(lng),
             'key': key}))
    resp_coordinates = response.json()

    if resp_coordinates['status'] == 'OK':
        return resp_coordinates['results'][0]['formatted_address']
    else:
        print('Failed to get json response:', resp_coordinates)
        return 'Address is not found'
{% endhighlight %}

<p align="center">
  <img alt="20201114-get-address-result"
  src="{{ site.baseurl }}/images/20201114-get-address-result.png"/>
</p>

## Conclusion
In this blog, I presented how to get coordinates and address by Google
Geocoding API, and how to accomplish it by Python. If you are curious about
more detailed information like geocoding responses' elements (status codes,
error messages), component filtering or reverse geocoding responses, you can
visit [Google Geocoding API's official website][geocoding-doc].

If you are interested in detailed python codes behind the graph, [here][notebook]
you are :)

## Reference
- "Google Geocoding API", _developers.google.com_. [Online]. Available: [https://developers.google.com/maps/documentation/geocoding/overview][geocoding-doc]
- T.H. Chia, "maps", _unsplash.com_. [Online]. Available: [https://unsplash.com/photos/tVZMk-cidEc][image]

[geocoding-doc]: https://developers.google.com/maps/documentation/geocoding/overview
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/google_geocoding_api/learning_google_geocoding_api.ipynb
[image]: https://unsplash.com/photos/tVZMk-cidEc
