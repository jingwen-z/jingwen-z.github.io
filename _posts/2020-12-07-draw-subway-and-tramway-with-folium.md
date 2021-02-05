---
layout:      post
title:       "Draw subway and tramway with folium"
date:        "2020-12-07 22:06:04 +0100"
tags:        [python3, folium, geovisualisation]
comments:    true
excerpt:     >
    This blog talks about how to draw public transport lines with "folium"
    module in Python.
cover:       /images/20201207-public-transport-lines.png
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    src: /images/20201207-subway.jpg
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

A map can clearly present information in terms of geography. Recently I learnt
how to draw public transport lines with `folium` module in Python. In this blog,
I will talk about how to do that with the following points:
- Datasets
- Draw transport lines with "folium"

## Datasets
Before drawing maps, I'll talk about the datasets which are used for this blog.
I downloaded [Île-de-France public transport network datasets][r1].

{% highlight python %}
import pandas as pd

idf_transport_geo = pd.read_json('data/transport/idf_ligne-transport.geojson')
idf_station_df = pd.read_csv('data/transport/idf-emplacement-des-gares.csv', sep=';', decimal='.')
{% endhighlight %}

<p align="center">
  <img alt="20201207-idf-transport-geo"
  src="{{ site.baseurl }}/images/20201207-idf-transport-geo.png"/>
</p>

<p align="center">
  <img alt="20201207-idf-station-df"
  src="{{ site.baseurl }}/images/20201207-idf-station-df.png"/>
</p>

{% highlight python %}
idf_station_df['lat'], idf_station_df['lng'] = zip(*idf_station_df['Geo Point'].apply(lambda x: x.split(',')))
idf_station_df['lat'] = idf_station_df['lat'].astype(float)
idf_station_df['lng'] = idf_station_df['lng'].astype(float)
idf_station_df = idf_station_df[idf_station_df['mode_'].isin(['Metro', 'RER'])]
{% endhighlight %}

To get stations' coordinates (latitude, longitude), we split the `Geo Point` by
`,`, convert the values to `float`, and filter only the subway and RER(Réseau
Express Régional, English: Regional Express Network).

## Draw transport lines with "folium"
{% highlight python %}
import folium

idf_map = folium.Map(location=[48.868, 2.365], zoom_start=12, tiles='Cartodb dark_matter')
for line_segment in idf_transport_geo['features']:
    gjson = folium.features.GeoJson(line_segment['geometry'],
                                    style_function = lambda x: {'color': '#00C4B3',
                                                                'weight': 1.5})
    idf_map.add_child(gjson)

for i, v in idf_station_df.iterrows():
    folium.CircleMarker(location=[v['lat'], v['lng']],
                        radius=1.2,
                        color='#00C4B3',
                        fill_color='#00C4B3',
                        fill=True).add_to(idf_map)

idf_map
{% endhighlight %}

I applied `geometry` which belongs to `idf_transport_geo['features']` with
`folium.features.GeoJson` to draw the transport lines, and add station points
with `folium.CircleMarker`, then we get the following map.

<p align="center">
  <img alt="20201207-idf-map"
  src="{{ site.baseurl }}/images/20201207-idf-map.png"/>
</p>

### Easter egg
I also visualise transport lines of many other cities:

<p align="center">
  <img alt="20201207-public-transport-lines"
  src="{{ site.baseurl }}/images/20201207-public-transport-lines.png"/>
</p>

If you are curious about the scripts, you will find them [here][notebook].

## Reference
- "Gares et stations du réseau ferré d'Île-de-France (par ligne)", _data.iledefrance-mobilites.fr_. [Online]. Available: [https://data.iledefrance-mobilites.fr/explore/dataset/emplacement-des-gares-idf/information/?location=16,48.85089,2.51991&basemap=jawg.streets][r1]
- "Stations de métro (Toulouse)", _data.toulouse-metropole.fr_. [Online]. Available: [https://data.toulouse-metropole.fr/explore/dataset/stations-de-metro/map/?location=16,43.60215,1.44379&basemap=jawg.streets][r2]
- "Itinéraires de métro dans OpenStreetMap", _www.data.gouv.fr_. [Online]. Available: [https://www.data.gouv.fr/fr/datasets/itineraires-de-metro-dans-openstreetmap/][r3]
- "Itinéraires de tramways dans OpenStreetMap", _www.data.gouv.fr_. [Online]. Available: [https://www.data.gouv.fr/fr/datasets/itineraires-de-tramways-dans-openstreetmap/][r4]
- "Using GeoPandas to convert Linestring UTM data to LatLong", _gis.stackexchange.com_. [Online]. Available: [https://gis.stackexchange.com/questions/351846/using-geopandas-to-convert-linestring-utm-data-to-latlong][r5]
- "Converting UTM to Lat/Long with a geoJSON file in pyproj", _gis.stackexchange.com_. [Online]. Available: [https://gis.stackexchange.com/questions/217012/converting-utm-to-lat-long-with-a-geojson-file-in-pyproj][r6]
- "Converting projected coordinates to lat/lon using Python?", _gis.stackexchange.com_. [Online]. Available: [https://gis.stackexchange.com/questions/78838/converting-projected-coordinates-to-lat-lon-using-python][r7]
- pyproj4, "pyproj4 / pyproj", _github.com_. [Online]. Available: [https://github.com/pyproj4/pyproj][r8]
- Turbo87, "Turbo87 / utm", _github.com_. [Online]. Available: [https://github.com/Turbo87/utm][r9]
- "Universal Transverse Mercator coordinate system", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system#From_UTM_coordinates_(E,_N,_Zone,_Hemi)_to_latitude,_longitude_(%CF%86,_%CE%BB)][r10]
- SplitShire, "metro subway rails railroad tracks", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/metro-subway-rails-railroad-tracks-407204/][backgroud-img]

[r1]: https://data.iledefrance-mobilites.fr/explore/dataset/emplacement-des-gares-idf/information/?location=16,48.85089,2.51991&basemap=jawg.streets
[r2]: https://data.toulouse-metropole.fr/explore/dataset/stations-de-metro/map/?location=16,43.60215,1.44379&basemap=jawg.streets
[r3]: https://www.data.gouv.fr/fr/datasets/itineraires-de-metro-dans-openstreetmap/
[r4]: https://www.data.gouv.fr/fr/datasets/itineraires-de-tramways-dans-openstreetmap/
[r5]: https://gis.stackexchange.com/questions/351846/using-geopandas-to-convert-linestring-utm-data-to-latlong
[r6]: https://gis.stackexchange.com/questions/217012/converting-utm-to-lat-long-with-a-geojson-file-in-pyproj
[r7]: https://gis.stackexchange.com/questions/78838/converting-projected-coordinates-to-lat-lon-using-python
[r8]: https://github.com/pyproj4/pyproj
[r9]: https://github.com/Turbo87/utm
[r10]: https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system#From_UTM_coordinates_(E,_N,_Zone,_Hemi)_to_latitude,_longitude_(%CF%86,_%CE%BB)
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/geovisualization/transport_lines.ipynb
[backgroud-img]: https://pixabay.com/photos/metro-subway-rails-railroad-tracks-407204/
