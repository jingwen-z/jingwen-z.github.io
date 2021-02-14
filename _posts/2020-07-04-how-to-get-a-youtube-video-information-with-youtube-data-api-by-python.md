---
layout:      post
title:       "How to get a YouTube video's information with YouTube Data API by Python?"
date:        "2020-07-04 09:03:55 +0200"
tags:        [python3, API]
comments:    true
excerpt:     >
    This blog talks about how to get YouTube video's/channel's information by
    YouTube Data API and Python scripts, like getting a video ID & channel ID
    with a query, getting a video’s statistics data with a video ID, getting a
    video’s comments, getting a channel’s information with channel ID, and
    getting a channel’s playlist.
cover:       /images/20200704-youtube-img.png
img_width:   1280
img_height:  905
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Imagine that your favorite singer releases a new song on YouTube, you listen to
the song and click a "like" or leave your reviews, or you go to your favorite
channel to see if there are some new releases. In this blog, I'll talk about how
to get YouTube videos' / channels' information with YouTube Data API with Python:
- What is YouTube Data API?
- What could we get by YouTube Data API?
- How to accomplish the request by Python?

## What is YouTube Data API?
The YouTube Data API is an API that provides access to YouTube data, such as
videos, playlists, and channels. It lets you incorporate functions normally
executed on the YouTube website into your website or application.

## What could we get by YouTube Data API?
In this section, I'll take the video of the last blog (Jay Chou Mojito) as an
example and talk about how to get its ID, its statistics data, its comments,
etc.

### Get a video ID & channel ID with a query
With the given query ("Jay Chou Mojito"), we can search the video with `search`.
A search result contains information about a YouTube video, channel, or playlist
that matches the search parameters specified in an API request. While a search
result points to a uniquely identifiable resource, like a video, it does not
have its persistent data. The API supports the `list` method for search, it
returns a collection of search results that match the query parameters specified
in the API request. By default, a search result set identifies matching video,
channel, and playlist resources, but you can also configure queries to only
retrieve a specific type of resource.

HTTP request:

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/search
{% endhighlight %}

You'll find all parameters [here][search-list-param].

#### Example
Search the video with "Jay Chou Mojito" query:

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/search?part=snippet&q=Jay%20Chou%20Mojito&key=[YOUR_API_KEY]
{% endhighlight %}

where
- the `part`(string) parameter specifies a comma-separated list of one or more
search resource properties that the API response will include. Set the parameter
value to `snippet`.
- the `q`(string) parameter specifies the query term to search for.

then we can get the result in "json" format:

<p align="center">
  <img alt="20200704-search-1"
  src="{{ site.baseurl }}/images/20200704-search-1.png"/>
</p>
<p align="center">
  <img alt="20200704-search-2"
  src="{{ site.baseurl }}/images/20200704-search-2.png"/>
</p>
...
<p align="center">
  <img alt="20200704-search-3"
  src="{{ site.baseurl }}/images/20200704-search-3.png"/>
</p>

We got 103131 results in total, what we need is only the official video which is
released by "周杰倫 Jay Chou", so we take the `videoId`(-biOGdYiF-I) and
`channelId`(UC8CU5nVhCQIdAGrFFp4loOQ) of the first result.

### Get a video's statistics data with a video ID
With the known `videoId`, we can check its statistics data with `videos`.
The `list` method returns a list of videos that match the API request
parameters.

HTTP request:

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/videos
{% endhighlight %}

You'll find all parameters [here][video-list-param].

#### Example
Retrieve information about the video with `videoId`.

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/videos?part=statistics&id=-biOGdYiF-I&key=[YOUR_API_KEY]
{% endhighlight %}

where
- the `part` parameter specifies a comma-separated list of one or more video
resource properties that the API response will include.
- the `id` parameter specifies a comma-separated list of the YouTube video ID(s)
for the resource(s) that are being retrieved. In a video resource, the id
property specifies the video's ID.

then we can get the result in "json" format:

<p align="center">
  <img alt="20200704-statistics"
  src="{{ site.baseurl }}/images/20200704-statistics.png"/>
</p>

There are 16295328 views since the release, 175632 likes, 7805 dislikes and
16676 comments.

### Get a video's comments
With the known `videoId`, we can check its comments with `commentThread`. A
`commentThread` resource contains information about a YouTube comment thread,
which comprises a top-level comment and replies, if any exist, to that comment.
A `commentThread` resource can represent comments about either a video or a
channel.

Both the top-level comment and the replies are actually `comment` resources
nested inside the `commentThread` resource. The `commentThread` resource does
not necessarily contain all replies to a comment, and you need to use the
`comments.list` method if you want to retrieve all replies for a particular
comment. Also note that some comments do not have replies.

The API supports the `list` method for commentThreads resources.

HTTP request:

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/commentThreads
{% endhighlight %}

You'll find all parameters [here][commentThreads-list-param].

#### Example
Retrieve all comment threads associated with a particular video.

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&videoId=-biOGdYiF-I&key=[YOUR_API_KEY]
{% endhighlight %}

where
- the `part` parameter specifies a comma-separated list of one or more
`commentThread` resource properties that the API response will include.
- the `videoId` parameter instructs the API to return comment threads
associated with the specified video ID.

then we can get the result in "json" format:

<p align="center">
  <img alt="20200704-comments-1"
  src="{{ site.baseurl }}/images/20200704-comments-1.png"/>
</p>
<p align="center">
  <img alt="20200704-comments-2"
  src="{{ site.baseurl }}/images/20200704-comments-2.png"/>
</p>
...
<p align="center">
  <img alt="20200704-comments-3"
  src="{{ site.baseurl }}/images/20200704-comments-3.png"/>
</p>

### Get a channel's information with channel ID
With the known `channelId`, we can check its statistics data with `channel`.
A `channel` resource contains information about a YouTube channel. We could use
`list` method to returns a collection of zero or more channel resources that
match the request criteria.

HTTP request:

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/channels
{% endhighlight %}

You'll find all parameters [here][channels-list-param].

#### Example
Retrieve channel data for the GoogleDevelopers YouTube channel. It uses the id
request parameter to identify the channel by its YouTube channel ID.

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/channels?part=snippet%2Cstatistics&id=UC8CU5nVhCQIdAGrFFp4loOQ&key=[YOUR_API_KEY]
{% endhighlight %}

where
- the `part` parameter specifies a comma-separated list of one or more channel
resource properties that the API response will include.
- the `id` parameter specifies a comma-separated list of the YouTube channel
ID(s) for the resource(s) that are being retrieved. In a channel resource, the
id property specifies the channel's YouTube channel ID.

then we can get the result in "json" format:

<p align="center">
  <img alt="20200704-channel-1"
  src="{{ site.baseurl }}/images/20200704-channel-1.png"/>
</p>
<p align="center">
  <img alt="20200704-channel-2"
  src="{{ site.baseurl }}/images/20200704-channel-2.png"/>
</p>

According to the results, we get not only the title and the description of the
channel, but also its statistics data like views count and subscriber count.

### Get a channel's playlist
A `playlist` resource represents a YouTube playlist. A playlist is a collection
of videos that can be viewed sequentially and shared with other users. By
default, playlists are publicly visible to other users, but playlists can be
public or private.

The API supports the `list` method for playlists resources, which returns a
collection of playlists that match the API request parameters. For example, you
can retrieve all playlists that the authenticated user owns, or you can retrieve
one or more playlists by their unique IDs.

HTTP request:

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/playlists
{% endhighlight %}

You'll find all parameters [here][playlists-list-param].

#### Example
Retrieve playlists owned by the YouTube channel that the request's `channelId`
parameter identifies.

{% highlight http %}
GET https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UC8CU5nVhCQIdAGrFFp4loOQ&key=[YOUR_API_KEY]
{% endhighlight %}

where
- the `part` parameter specifies a comma-separated list of one or more
`playlist` resource properties that the API response will include.
- the `channelId`'s value indicates that the API should only return the
specified channel's playlists.

<p align="center">
  <img alt="20200704-playlists-1"
  src="{{ site.baseurl }}/images/20200704-playlists-1.png"/>
</p>

<p align="center">
  <img alt="20200704-playlists-2"
  src="{{ site.baseurl }}/images/20200704-playlists-2.png"/>
</p>
...
<p align="center">
  <img alt="20200704-playlists-3"
  src="{{ site.baseurl }}/images/20200704-playlists-3.png"/>
</p>

According to the results, we get information like author, title, description,
tags, and timeCreated.

## How to accomplish the request by Python?
Google creates a Python SDK for Python users, we will apply it in this section.

**Prerequisites**
- Python 2.7 or Python 3.5+
- The pip package management tool
- The Google APIs Client Library for Python<br>
  `pip install --upgrade google-api-python-client`
- The google-auth-oauthlib and google-auth-httplib2 libraries for user authorization<br>
  `pip install --upgrade google-auth-oauthlib google-auth-httplib2`

### Get a video ID & channel ID with a query
{% highlight python %}
# -*- coding: utf-8 -*-
# Sample Python code for youtube.search.list

import os

import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

scopes = ["https://www.googleapis.com/auth/youtube.force-ssl"]

def main():
    # Disable OAuthlib's HTTPS verification when running locally.
    # *DO NOT* leave this option enabled in production.
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    api_service_name = "youtube"
    api_version = "v3"
    client_secrets_file = "YOUR_CLIENT_SECRET_FILE.json"

    # Get credentials and create an API client
    flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
        client_secrets_file, scopes)
    credentials = flow.run_console()
    youtube = googleapiclient.discovery.build(
        api_service_name, api_version, credentials=credentials)

    request = youtube.search().list(
        part="snippet",
        q="Jay Chou Mojito"
    )
    response = request.execute()

    print(response)

if __name__ == "__main__":
    main()
{% endhighlight %}

- `google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file()`
creates a :class:`Flow` instance from a Google client secrets file.
- `googleapiclient.discovery.build()` construct a Resource object for
interacting with an API. The `serviceName` and `version` are the names of the
Discovery service.
- `youtube.search().list()` calls the search.list method to retrieve results
matching the specified query term.

### Get a video's statistics data with a video ID
{% highlight python %}
# -*- coding: utf-8 -*-
# Sample Python code for youtube.videos.list

import os

import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

scopes = ["https://www.googleapis.com/auth/youtube.readonly"]

def main():
    # Disable OAuthlib's HTTPS verification when running locally.
    # *DO NOT* leave this option enabled in production.
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    api_service_name = "youtube"
    api_version = "v3"
    client_secrets_file = "YOUR_CLIENT_SECRET_FILE.json"

    # Get credentials and create an API client
    flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
        client_secrets_file, scopes)
    credentials = flow.run_console()
    youtube = googleapiclient.discovery.build(
        api_service_name, api_version, credentials=credentials)

    request = youtube.videos().list(
        part="statistics",
        id="-biOGdYiF-I"
    )
    response = request.execute()

    print(response)

if __name__ == "__main__":
    main()
{% endhighlight %}

- `google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file()`
creates a :class:`Flow` instance from a Google client secrets file.
- `googleapiclient.discovery.build()` construct a Resource object for
interacting with an API. The `serviceName` and `version` are the names of the
Discovery service.
- `youtube.videos().list()` calls the API's videos.list method to retrieve the
video resource.

### Get a video's comments
{% highlight python %}
# -*- coding: utf-8 -*-
# Sample Python code for youtube.commentThreads.list

import os

import googleapiclient.discovery

def main():
    # Disable OAuthlib's HTTPS verification when running locally.
    # *DO NOT* leave this option enabled in production.
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    api_service_name = "youtube"
    api_version = "v3"
    DEVELOPER_KEY = "YOUR_API_KEY"

    youtube = googleapiclient.discovery.build(
        api_service_name, api_version, developerKey = DEVELOPER_KEY)

    request = youtube.commentThreads().list(
        part="snippet",
        videoId="-biOGdYiF-I"
    )
    response = request.execute()

    print(response)

if __name__ == "__main__":
    main()
{% endhighlight %}

- `googleapiclient.discovery.build()` construct a Resource object for
interacting with an API. The `serviceName` and `version` are the names of the
Discovery service.
- `youtube.commentThreads().list()` calls the API's `commentThreads.list` method
to list the existing comments.


### Get a channel's information with channel ID
{% highlight python %}
# -*- coding: utf-8 -*-
# Sample Python code for youtube.channels.list

import os

import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

scopes = ["https://www.googleapis.com/auth/youtube.readonly"]

def main():
    # Disable OAuthlib's HTTPS verification when running locally.
    # *DO NOT* leave this option enabled in production.
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    api_service_name = "youtube"
    api_version = "v3"
    client_secrets_file = "YOUR_CLIENT_SECRET_FILE.json"

    # Get credentials and create an API client
    flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
        client_secrets_file, scopes)
    credentials = flow.run_console()
    youtube = googleapiclient.discovery.build(
        api_service_name, api_version, credentials=credentials)

    request = youtube.channels().list(
        part="snippet,statistics",
        id="UC8CU5nVhCQIdAGrFFp4loOQ"
    )
    response = request.execute()

    print(response)

if __name__ == "__main__":
    main()
{% endhighlight %}

- `google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file()`
creates a :class:`Flow` instance from a Google client secrets file.
- `googleapiclient.discovery.build()` construct a Resource object for
interacting with an API. The `serviceName` and `version` are the names of the
Discovery service.
- `youtube.channels().list()` calls the API's `channels.list` method
to retrieve channel data for the GoogleDevelopers YouTube channel.

### Get a channel's playlist

{% highlight python %}
# -*- coding: utf-8 -*-
# Sample Python code for youtube.playlists.list

import os

import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

scopes = ["https://www.googleapis.com/auth/youtube.readonly"]

def main():
    # Disable OAuthlib's HTTPS verification when running locally.
    # *DO NOT* leave this option enabled in production.
    os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

    api_service_name = "youtube"
    api_version = "v3"
    client_secrets_file = "YOUR_CLIENT_SECRET_FILE.json"

    # Get credentials and create an API client
    flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
        client_secrets_file, scopes)
    credentials = flow.run_console()
    youtube = googleapiclient.discovery.build(
        api_service_name, api_version, credentials=credentials)

    request = youtube.playlists().list(
        part="snippet",
        channelId="UC8CU5nVhCQIdAGrFFp4loOQ"
    )
    response = request.execute()

    print(response)

if __name__ == "__main__":
    main()
{% endhighlight %}

- `google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file()`
creates a :class:`Flow` instance from a Google client secrets file.
- `googleapiclient.discovery.build()` construct a Resource object for
interacting with an API. The `serviceName` and `version` are the names of the
Discovery service.
- `youtube.playlists().list()` calls the API's `playlists.list` method
to retrieve playlists owned by the YouTube channel that the request’s
`channelId` parameter identifies.

## Reference
- "YouTube Data API", _developers.google.com_. [Online]. Available: [https://developers.google.com/youtube/v3/docs][r1]
- "Code Samples / Running code samples locally / Python", _developers.google.com_. [Online]. Available: [https://developers.google.com/explorer-help/guides/code_samples#python][r2]
- "youtube / api-samples", _github.com_. [Online]. Available: [https://github.com/youtube/api-samples/tree/master/python][r3]
- geralt, "Hand touch YouTube icon", _pixabay.com_. [Online]. Available: [https://pixabay.com/illustrations/hand-touch-you-tube-you-tube-icon-589488/][r4]

[r1]: https://developers.google.com/youtube/v3/docs
[r2]: https://developers.google.com/explorer-help/guides/code_samples#python
[r3]: https://github.com/youtube/api-samples/tree/master/python
[r4]: https://pixabay.com/illustrations/hand-touch-you-tube-you-tube-icon-589488/
[search-list-param]: https://developers.google.com/youtube/v3/docs/search/list#parameters
[video-list-param]: https://developers.google.com/youtube/v3/docs/videos/list#parameters
[commentThreads-list-param]: https://developers.google.com/youtube/v3/docs/commentThreads/list#parameters
[channels-list-param]: https://developers.google.com/youtube/v3/docs/channels/list#parameters
[playlists-list-param]: https://developers.google.com/youtube/v3/docs/playlists/list#parameters
