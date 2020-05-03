---
layout:             post
title:              "How to install python module fiona on Windows OS ?"
date:               "2019-06-26 20:41:26 +0200"
last_modified_at:   2019-08-27 23:01:05 +0200
tags:               [python3, fiona, Windows OS]
comments:           true
excerpt:            >
    In this blog, I talk about the requirements and the steps for installing module
    fiona on Windows OS.
img_url:            /images/20190626-map.png
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Map"
  src="{{ site.baseurl }}/images/20190626-map.png"/>
</p>

Recently, I learn how to visualise geographical data with python. However, I
met difficulties when I installed the module `fiona` (on my professional PC
which is Windows OS). So in this blog, I'll introduce how to install `fiona`
module on Windows OS with following points:
- What is `fiona` ?
- Python Requirements
- Download a binary distribution of GDAL
- Fiona's binary wheel
- Frequently Questioned Answers (FQA)

## What is "fiona" ?
`Fiona` is designed to be simple and dependable. It focuses on reading and
writing data in standard Python IO style and relies upon familiar Python types
and protocols such as files, dictionaries, mappings, and iterators instead of
classes specific to OGR. Fiona can read and write real-world data using
multi-layered GIS formats and zipped virtual file systems and integrates readily
with other Python GIS packages such as `pyproj`, `Rtree`, and `Shapely`.

## Python Requirements
- Python versions 2.7 or 3.4+.
- [GDAL version 1.11-2.4][GDAL module]. ❗ **GDAL version 3 is not yet supported.**
- Fiona depends on the modules `enum34`, `six`, `cligj`, `munch`, `argparse`,
and `ordereddict`. Pip will fetch these requirements for you, _but users
installing Fiona from a Windows installer must get them separately_.

## Download a binary distribution of GDAL
### URL
You can download it [here][GDAL old release].

<p align="center">
  <img alt="GDAL old releases"
  src="{{ site.baseurl }}/images/20190626-GDAL-old-releases.PNG"/>
</p>

### Choose "win32" or "x64"?
It depends on your python:
{% highlight python %}
import struct
print(struct.calcsize("P") * 8)
{% endhighlight %}
You will get 64 or 32 to indicate which python version do you have installed.

### What should we download?
Since python that I have installed is version Python 3.7 (32 bit), I choose
"release-1911-gdal-2-4-1-mapserver-7-2-2".

<p align="center">
  <img alt="GDAL download table"
  src="{{ site.baseurl }}/images/20190626-GDAL-download-table.PNG"/>
</p>

We need to download:
* Compiled binaries in a single .zip package.
* Compiled libraries and headers.
* Generic installer for the GDAL core components.
* Installer for the GDAL python bindings (requires to install the GDAL core).

### Update environment variables
* `PATH`: C:\Program Files (x86)\GDAL
* `GDAL_DATA`: C:\Program Files (x86)\GDAL\gdal-data
* `GDAL_DRIVER_PATH`: C:\Program Files (x86)\GDAL\gdalplugins
* `GDAL_VERSION`: 2.4.1

    > How to check GDAL version ?<br>
    > Type following command in cmd: `gdalinfo --version`

## Fiona's binary wheel
You can download it [here][fiona module].

## FQA
- Q1: ImportError: DLL load failed: %1 is not a valid Win32 application
(ImportError: DLL load failed: %1 n est pas une application Win32 valide)<br>
This might because your python is 32 bit version. Thus, all python modules
should be 32 bit as well. Similarly, if your python is 64 bit version, you
should install 64 bit python modules.

- Q2: … is not a supported wheel on this platform<br>
Item.

- Q3: ImportError: DLL load failed: The specified module could not be found.<br>
Maybe you forgot installing one/some of dependencies of module `fiona`: `GDAL`,
`enum34`, `six`, `cligj`, `munch`, `argparse`, and `ordereddict`.
More detail in section "Python Requirements".

## Conclusion
In this blog, I talk about the requirements and the steps for installing module
`fiona` on Windows OS. Hope it's useful for you!

## References
- Toblerity, "Fiona", _github.com_. [Online]. Available: [https://github.com/Toblerity/Fiona][fiona]
- Mohamed Ali Jamaoui, "Check if python version is 64 or 32 bit", _Intelligea_. [Online]. Available: [https://intelligea.wordpress.com/2015/08/05/check-if-python-version-is-64-or-32-bit/][python32or64]
- Albert Kochaphum, "Installing GDAL for Windows", _UCLA Sandbox_. [Online]. Available: [https://sandbox.idre.ucla.edu/sandbox/tutorials/installing-gdal-for-windows][checkGDALversion]

[GDAL module]: https://www.lfd.uci.edu/~gohlke/pythonlibs/#gdal
[GDAL old release]: http://www.gisinternals.com/archive.php
[fiona module]: https://www.lfd.uci.edu/~gohlke/pythonlibs/#fiona
[fiona]: https://github.com/Toblerity/Fiona
[python32or64]: https://intelligea.wordpress.com/2015/08/05/check-if-python-version-is-64-or-32-bit/
[checkGDALversion]: https://sandbox.idre.ucla.edu/sandbox/tutorials/installing-gdal-for-windows
