---
layout:             post
title:              "R: Working with GeoJSON data and resolve 'Error in ogrInfo'"
date:               2017-04-06 23:32:43 +0200
last_modified_at:   2018-08-05 10:06:02 +0200
tags:               [R]
comments:           true
excerpt:            >
    This blog presents how to work with GeoJSON data in R, and proposes the
    solution of "Error in ogrInfo(dsn = dsn, layer = layer, encoding = encoding,
    use_iconv = use_iconv"
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Since working in franprix, I've accomplished many projects, for different
departments. Thanks to this opportunity, I understood business of various 
services and learnt lots of technique of R. Today I'd like to share with you how
to read `GeoJSON` data in R.

Concerning the dataset, we take the [Paris international tourist area][Paris international tourist area]
as an example. Then we use either `rgdal` or `geojsonio` package, and read it as
following.

{% highlight r %}
ztiData <- "zones-touristiques-internationales-paris.geojson"
ztiPolygon <- rgdal::readOGR(dsn = ztiData,
                             layer = "OGRGeoJSON",
                             require_geomType = "wkbPolygon",
                             encoding = "UTF-8")
# or use the geojson_read() function
# ztiPolygon <- geojsonio::geojson_read(ztiData, what = "sp")

# then make a map with following scripts
ztiParis <- leaflet(ztiPolygon) %>%
            addTiles() %>%
            addPolygons(stroke = FALSE,
                        smoothFactor = 0.3,
                        fillOpacity = 0.5,
                        fillColor = "blue",
                        label = ~ paste0(name))
{% endhighlight %}

<iframe
  src="{{ site.baseurl }}/images/20170406-ztiParis.html"
  style="display: block; width:100%; height: 200px">
  <p>Paris tourist area</p>
</iframe>

Moreover, for reading `GeoJSON` data, many web sites recommend similar codes but
_without_ `require_geomType` parameter, and many people get following errors:

{% highlight r %}
ztiPolygon <- rgdal::readOGR(dsn = ztiData, layer = "OGRGeoJSON")

> Error in ogrInfo(dsn = dsn, layer = layer, encoding = encoding,
> use_iconv = use_iconv,  :
> Multiple incompatible geometries: wkbPoint: 6; wkbPolygon: 13
{% endhighlight %}

Thanks to [stackoverflow][stackoverflow], I understood what the error means, and
extract the features that I need.

{% highlight r %}
ogrListLayers(ztiData)
ogrInfo(ztiData, "OGRGeoJSON")
ogrInfo(ztiData, "OGRGeoJSON", require_geomType="wkbPoint")
# NOTE: keeping only 6 wkbPoint of 19 features
# note that extent applies to all features
# Driver: GeoJSON; number of rows: 19 
# selected geometry type: wkbPoint with 6 rows
# Feature type: wkbPoint with 2 dimensions
# Extent: (2.280886 48.82001) - (2.388132 48.88772)
# CRS: +proj=longlat +datum=WGS84 +no_defs  
# Number of fields: 17
#
#                     name type length typeName
# 1         nom_de_la_gare    4      0   String
# 2                adresse    4      0   String
# ...

ogrInfo(ztiData, "OGRGeoJSON", require_geomType="wkbPolygon")
# NOTE: keeping only 13 wkbPolygon of 19 features
# note that extent applies to all features
# Driver: GeoJSON; number of rows: 19 
# selected geometry type: wkbPolygon with 13 rows
# Feature type: wkbPolygon with 2 dimensions
# Extent: (2.280886 48.82001) - (2.388132 48.88772)
# CRS: +proj=longlat +datum=WGS84 +no_defs  
# Number of fields: 17

points <- readOGR(ztiData,
                  "OGRGeoJSON",
                  require_geomType="wkbPoint")
# Selected wkbPoint feature type, with 6 rows
# It has 17 fields
# NOTE: keeping only 6 wkbPoint of 19 features

polygons <- readOGR(ztiData,
                    "OGRGeoJSON",
                    require_geomType="wkbPolygon")
# Selected wkbPolygon feature type, with 13 rows
# It has 17 fields
# NOTE: keeping only 13 wkbPolygon of 19 features

# prove they red and orange in things
plot(points, add = TRUE, col = "red")
plot(polygons, add = TRUE, col = "orange")
{% endhighlight %}

After confirming with codes above, I could make sure that `wkbPolygon` is the
parameter needed, so it was added in the codes at the beginning.

This method can be also applied with the result of `leaflet()`. We can plot some
places in the map with `leaflet()`, then use `addPolygons()` to add the
ploygons-layer.

[Paris international tourist area]: http://u.osmfr.org/m/50342
[stackoverflow]: http://stackoverflow.com/questions/30583048/convert-features-of-a-multifeature-geojson-into-r-spatial-objects
