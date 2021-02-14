---
layout:      post
title:       "How to convert projected coordinates to latitude longitude by Python?"
date:        "2021-01-10 16:44:58 +0100"
tags:        [python3]
comments:    true
excerpt:     >
    This blog talks about how to convert projected coordinates to latitude
    longitude with python module "pyproj".
cover:       /images/20210110-image.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Last month I [drew subway and tramway lines with `folium`][draw-transport-lines]
according to the [Île-de-France public transport network datasets][r1]. However,
the coordinates are not what we use in GPS (EPSG:4326), but the Mercator
projection (EPSG:3857).

<p align="center">
  <img alt="input1"
  src="{{ site.baseurl }}/images/20210110-input-1.png"/>
</p>
...
<p align="center">
  <img alt="input2"
  src="{{ site.baseurl }}/images/20210110-input-2.png"/>
</p>

Thus, before drawing the transport lines, we need to convert projected
coordinates to latitude longitude. In this blog, I'll talk about this with the
following points:
- What is EPSG:4326?
- What is EPSG:3857?
- How to convert projected coordinates to latitude longitude?

## What is EPSG:4326?
The World Geodetic System (WGS) is a standard for use in cartography, geodesy,
and satellite navigation including GPS. This standard includes the definition of
the coordinate system's fundamental and derived constants, the ellipsoidal
(normal) Earth Gravitational Model (EGM), a description of the associated World
Magnetic Model (WMM), and a current list of local datum transformations.
The latest revision is WGS 84 (also known as WGS 1984, EPSG:4326), established
and maintained by the United States National Geospatial-Intelligence Agency
since 1984, and last revised in 2004. Earlier schemes included WGS 72, WGS 66,
and WGS 60. WGS 84 is the reference coordinate system used by the Global
Positioning System.

## What is EPSG:3857?
Web Mercator, Google Web Mercator, Spherical Mercator, WGS 84 Web Mercator or
WGS 84/Pseudo-Mercator is a variant of the Mercator projection and is the de
facto standard for Web mapping applications. It rose to prominence when Google
Maps adopted it in 2005. It is used by virtually all major online map providers,
including Google Maps, Mapbox, Bing Maps, OpenStreetMap, Mapquest, Esri, and
many others. Its official EPSG identifier is EPSG:3857, although others have
been used historically.

## How to convert projected coordinates to latitude longitude?
The Python module [`pyproj`][pyproj] is a cartographic projections and
coordinate transformations library, which converts from longitude, latitude to
native map projection x,y coordinates and vice versa, its classes `Proj` and
`transform` will help us to get the GPS coordinates.

A [`Proj`][Proj] class instance is initialized with proj map projection control
parameter key/value pairs. The key/value pairs can either be passed in a
dictionary, or as keyword arguments, or as a PROJ string (compatible with the
proj command).
  performs cartographic transformations: converting from
longitude, latitude to native map projection x,y coordinates and vice versa. The
[`Transform.er`][Transformer] class is also for facilitating re-using transforms
without needing to re-create them. The goal is to make repeated transforms faster.

### Method 1
{% highlight python %}
import pyproj

wgs84 = pyproj.Proj(projparams = 'epsg:4326')
InputGrid = pyproj.Proj(projparams = 'epsg:3857')

x1, y1 = -11705274.6374,4826473.6922
pyproj.transform(InputGrid, wgs84, x1, y1)
{% endhighlight %}

We firstly set 2 variables `wgs84` and `InputGrid` by specifying the
`projparams`, then transfer the point (x1, y1) from the coordinate system
"EPSG:3857" to the "EPSG:4326".

<p align="center">
  <img alt="method1"
  src="{{ site.baseurl }}/images/20210110-metho1.png"/>
</p>

We got the results but with a warning message as above. After checking the
[recommendation][pyproj2 to 1], now we have another method.

### Method 2
{% highlight python %}
transformer = pyproj.Transformer.from_crs("epsg:3857", "epsg:4326")
transformer.transform(x1, y1)
{% endhighlight %}

For the second method, we create a transformer from a `pyproj.crs.CRS`, with
`crs_from="epsg:3857"` and `crs_to="epsg:4326"`, then transform the point
(x1, y1), we can get the same result as the first method, without any warning
message.

<p align="center">
  <img alt="method2"
  src="{{ site.baseurl }}/images/20210110-metho2.png"/>
</p>

### Use case
So how to solve the problem at the beginning of this article?
Idea is that we go through the projected coordinates, and transform each of them
to "EPSG:4326".

{% highlight python %}
transformer = pyproj.Transformer.from_crs("epsg:3857", "epsg:4326")
for feature in subway_lines_df['features']:
    if feature['geometry']['type'] == 'LineString':
        # all coordinates
        coords = feature['geometry']['coordinates']
        # coordList is for each individual polygon
        for coordList in coords:
            lat_grid, lng_grid = coordList
            # do transformation
            # coordList[0],coordList[1] = pyproj.transform(InputGrid, wgs84, lat_grid, lng_grid) # methode 1
            coordList[0],coordList[1] = transformer.transform(lat_grid, lng_grid) # methode 2
    elif feature['geometry']['type'] == 'MultiLineString':
        len_coord = len(feature['geometry']['coordinates'])
        for c in range(len_coord):
            coords = feature['geometry']['coordinates'][c]
            for coordList in coords:
                lat_grid, lng_grid = coordList
                # coordList[0],coordList[1] = pyproj.transform(InputGrid, wgs84, lat_grid, lng_grid) # methode 1
                coordList[0],coordList[1] = transformer.transform(lat_grid, lng_grid) # methode 2
{% endhighlight %}

If you are curious about the scripts, you will find them [here][notebook].

## References
- "Gares et stations du réseau ferré d'Île-de-France (par ligne)", _data.iledefrance-mobilites.fr_. [Online]. Available: [https://data.iledefrance-mobilites.fr/explore/dataset/emplacement-des-gares-idf/information/?location=16,48.85089,2.51991&basemap=jawg.streets][r1]
- "World Geodetic System", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/World_Geodetic_System][r2]
- "Web Mercator projection", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/Web_Mercator_projection][r3]
- Antonio Falciano, "Converting projected coordinates to lat/lon using Python?", _gis.stackexchange.com_. [Online]. Available: [https://gis.stackexchange.com/questions/78838/converting-projected-coordinates-to-lat-lon-using-python][r4]
- PIRO4D, "Mission to Mars", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/mission-to-mars-mars-probe-2645472/][image]

[r1]: https://data.iledefrance-mobilites.fr/explore/dataset/emplacement-des-gares-idf/information/?location=16,48.85089,2.51991&basemap=jawg.streets
[r2]: https://en.wikipedia.org/wiki/World_Geodetic_System
[r3]: https://en.wikipedia.org/wiki/Web_Mercator_projection
[r4]: https://gis.stackexchange.com/questions/78838/converting-projected-coordinates-to-lat-lon-using-python
[draw-transport-lines]: https://jingwen-z.github.io/draw-subway-and-tramway-with-folium/
[pyproj]: https://pyproj4.github.io/pyproj/stable/
[Proj]: https://pyproj4.github.io/pyproj/stable/api/proj.html?highlight=proj
[Transformer]: https://pyproj4.github.io/pyproj/v2.6.1rel/api/transformer.html?highlight=transform
[pyproj2 to 1]: https://pyproj4.github.io/pyproj/stable/gotchas.html#upgrading-to-pyproj-2-from-pyproj-1
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/geovisualization/converting_projected_coordinates_to_latlon.ipynb
[image]: https://pixabay.com/photos/mission-to-mars-mars-probe-2645472/
