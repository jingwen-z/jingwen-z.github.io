---
layout:      post
title:       "How far is the nearest franprix?"
date:        "2019-12-06 16:49:24 +0100"
comments:    true
excerpt:     >
    Franprix is a network of grocery stores mainly located in Ile-de-France.
    Today there are already more than 800 stores in France. In this blog, I
    create a map to display how far is the nearest franprix for each community
    with python modules "folium" and "shapely".
img_url:     /images/20191206-nearest-fx-distance.png
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="The nearest franprix distance"
  src="{{ site.baseurl }}/images/20191206-nearest-fx-distance.png"/>
</p>

Franprix is a network of grocery stores mainly located in Ile-de-France. Today
there are already more than 800 stores in France. Inspired by
[Boris' portfolio][Boris], I created the map above with `folium` and `shapely`
modules of python. According to the map, we can obviously find that the
majority of stores are in Ile-de-France, some are located in central France and
Southeast of France, like Lyon, Marseille, etc.

In the following part, I'll talk about how to draw this map by python `folium`
and `shapely` modules with the following points:
- Data preparation
- Geovisualization

## Data preparation
### Import datasets
First of all, we need stores' location, communities' and departments' polygon
data to draw areas on the map.

{% highlight python %}
gps_df = pd.read_excel('franprix_gps.xlsx')
dept_geo = gpd.read_file('departements.geojson', driver='GeoJSON')
commune_geo = gpd.read_file('communes.geojson', driver='GeoJSON')
{% endhighlight %}

<p align="center">
  <img alt="gps_df.info()"
  src="{{ site.baseurl }}/images/20191206-stores-info.png"/>
</p>

In the store-location dataset, we have data like "IMAGS" to identify stores,
"Zip code" specifies the store's zip code, longitude and latitude can help us
to determine the location.

<p align="center">
  <img alt="dept_geo.head()"
  src="{{ site.baseurl }}/images/20191016-deptgeo-df.png"/>
</p>

<p align="center">
  <img alt="commune_geo.info()"
  src="{{ site.baseurl }}/images/20191206-commune-geo-info.png"/>
</p>

For the polygon data, we only need “code” and “insee_com” to match the
department and community, and “geometry” to draw polygons.

### Data cleaning
Before calculating distance between each store and community, we need to find
their department code, so for the department that contains stores, we will only
calculate the distance between department's stores and department's border; for
the department without stores, we will calculate the distance between each
store and department's border.

{% highlight python %}
gps_df['CP'] = gps_df['CP'].apply(lambda x: ('00000%d' % x)[-5:])
gps_df['CODE_DEPT'] = gps_df['CP'].apply(lambda x: x[:2])

mags_geometry = [Point(xy) for xy in zip(gps_df.LNG, gps_df.LAT)]
crs = {'init': 'epsg:4326'}
gps_gdf = gpd.GeoDataFrame(gps_df, crs=crs, geometry=mags_geometry)
{% endhighlight %}

Since some communities have the same name in different departments, I also
created a column to combine them.

{% highlight python %}
commune_geo['nom_dept_com'] = commune_geo.apply(lambda row: row['nom_dep'] + ':' + row['nom_com'],
                                                axis='columns')
{% endhighlight %}

### Distance calculating
In order to find the shortest distance between a franprix and a community, the
idea is that creating a dictionary, put "nom_dept_com" as keys and distance as
values; update distance if the existing one is greater than the new one. For
calculating the distance, I applied the `boundary.distance()` function.

{% highlight python %}
def fill_dist_dict(commune_polygon, store_point, nom_dept_com, dist_dict):
    dist = commune_polygon.boundary.distance(store_point)
    if not nom_dept_com in dist_dict:
        dist_dict[nom_dept_com] = dist
    else:
        if dist < dist_dict[nom_dept_com]:
            dist_dict[nom_dept_com] = dist
    return dist_dict

def calcul_shortest_distance(insee_dep, commune_polygon, nom_dept_com,
                             store_dept, dist_dict, gps_gdf):
    if insee_dep in store_dept:
        dist_dict = gps_gdf[
            gps_gdf['CODE_DEPT'] == insee_dep].apply(lambda row:fill_dist_dict(commune_polygon,
                                                                               row['geometry'],
                                                                               nom_dept_com,
                                                                               dist_dict),
                                                     axis='columns')
    else:
        dist_dict = gps_gdf.apply(lambda row:fill_dist_dict(commune_polygon,
                                                            row['geometry'],
                                                            nom_dept_com,
                                                            dist_dict),
                                  axis='columns')

    return dist_dict

store_dept = gps_df.CODE_DEPT.unique()
dist_dict = {}

dist_dict = commune_geo.apply(lambda row:calcul_shortest_distance(row['insee_dep'],
                                                                  row['geometry'],
                                                                  row['nom_dept_com'],
                                                                  store_dept,
                                                                  dist_dict,
                                                                  gps_df),
                              axis='columns')

commune_geo['shortest_distance'] = commune_geo['nom_dept_com'].map(dist_dict.iloc[0, 0])
{% endhighlight %}

Moreover, I applied `convex_hull` to avoid gaps between two polygons.

{% highlight python %}
commune_geo['geometry_hull'] = commune_geo.geometry.convex_hull
{% endhighlight %}

<p align="center">
  <img alt="dept_geo.head()"
  src="{{ site.baseurl }}/images/20191206-commune-geo-info2.png"/>
</p>

## Geovisualization
I've talked about the elements of geovisualization in [this blog][geo-elements],
so I'll simply show my codes here:

{% highlight python %}
colormap_commune = cm.StepColormap(
    colors=['#8e2d09', '#d45410', '#fe8e25',
            '#fed383', '#ffffce'],
    vmin=min(commune_visu_gdf['shortest_distance_km']),
    vmax=max(commune_visu_gdf['shortest_distance_km']),
    index=[0, 10, 50, 100, 200,
           round(commune_visu_gdf['shortest_distance_km'].max(), 0)])

shops_map = folium.Map(location=[46.803354, 1.8883335], zoom_start = 7)
folium.TileLayer('cartodbpositron').add_to(shops_map)

style_function = lambda x: {
    'fillColor': colormap_commune(x['properties']['shortest_distance_km']),
    'color': '',
    'weight': 0,
    'fillOpacity': 1
}

folium.GeoJson(commune_visu_gdf,
               style_function = style_function,
               name='Commune').add_to(shops_map)

folium.GeoJson(dept_geo,
               style_function = lambda x: {
                   'color': 'gray',
                   'weight': 1,
                   'fillOpacity': 0},
               name='Departement').add_to(shops_map)

for i,r in gps_gdf.iterrows():
    folium.CircleMarker(location=[r.LAT, r.LNG],
                        radius=1, 
                        color='black',
                        fill_color='black',
                        fill=True).add_to(shops_map)

macro = MacroElement()
macro._template = Template(template1)
macro2 = MacroElement()
macro2._template = Template(template_title)

shops_map.get_root().add_child(macro)
shops_map.get_root().add_child(macro2)
{% endhighlight %}

<p align="center">
  <img alt="The nearest franprix distance"
  src="{{ site.baseurl }}/images/20191206-nearest-fx-distance.png"/>
</p>

If you are interested in detailed python codes behind the graph,
[here][notebook] you are :)

## Reference
- "Contours géographiques simplifiés des communes – 2019", _public.opendatasoft.com_. [Online]. Available: [https://public.opendatasoft.com/explore/dataset/contours-geographiques-simplifies-des-communes-2019/export/][datasource1]
- Grégoire David, "Departments polygon", _github.com_. [Online]. Available: [https://github.com/gregoiredavid/france-geojson/blob/master/departements.geojson][datasource2]
- Mike T, "Distance from point to polygon when inside", _stackoverflow.com_. [Online]. Available: [https://stackoverflow.com/questions/36972537/distance-from-point-to-polygon-when-inside][distance]
- Diogo Caribé, "Python Shapely - filling small gaps between multi polygons", _gis.stackexchange.com_. [Online]. Available: [https://gis.stackexchange.com/questions/201378/python-shapely-filling-small-gaps-between-multi-polygons][fillgaps]

[Boris]: https://www.sites.univ-rennes2.fr/mastersigat/B_Mericskay/index.html
[geo-elements]: https://jingwen-z.github.io/how-to-draw-a-map-with-folium-module-in-python/
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/analysis/nearest_franprix_map/franprix_map.ipynb
[datasource1]: https://public.opendatasoft.com/explore/dataset/contours-geographiques-simplifies-des-communes-2019/export/
[datasource2]: https://github.com/gregoiredavid/france-geojson/blob/master/departements.geojson
[distance]: https://stackoverflow.com/questions/36972537/distance-from-point-to-polygon-when-inside
[fillgaps]: https://gis.stackexchange.com/questions/201378/python-shapely-filling-small-gaps-between-multi-polygons
