---
layout:      post
title:       "R IN ACTION Review 2 - Getting started with graphs"
date:        "2017-04-15 10:51:27 +0200"
tags:        [R, visualisation]
comments:    true
---

This blog reviews general methods for working with graphs. We'll begin with how
to create and save graphs, then talk about how to modify the features of graph.

## Creating and saving graphs

Creating a new graph by issuing a high-level plotting command such as `plot()`,
`hist()`, or `boxplot()` typically overwrites a previous graph. But how to
create more than one graph and still have access to each? There are several
methods.

First, we can open a new graph window _before_ creating a new graph:

{% highlight r %}
dev.new()
  statements to create graph 1
dev.new()
  statements to create graph 2
{% endhighlight %}

Each new graph will appear in the most recently opened window.

Then we can use the functions `dev.new()`, `dev.next()`, `dev.prev()`,
`dev.set()` and `dev.off()` to have multiple graph window open at one time and
choose which output is sent to which window. See `help(dev.cur)` for details.

If you want to save your graphs, you can do it via the following codes, sandwich
the statements that produce the graph berween a statement that sets a
destination and a statement that closes that destination.

{% highlight r %}
pdf("my-graph.pdf")
  plot(mtcars$wt, mtcars$mpg)
  abline(lm(mtcars$mpg ~ mtcars$wt))
  title("Regression of MPG on Weight")
dev.off()
{% endhighlight %}

In additon to `pdf()`, we can use the functions `win.metafile()`, `png()`,
`jpeg()`, `bmp()`, `tiff()`, `xfig()`, and `postscript()` to save graphs in
other formats (Note: the `win.metafile()` function is only available on Windows
platforms).

## Graphical parameters

We can customize many features of a graph (fonts, colors, axes, and labels)
through options called _graphical parameters_. One way to specify these options
is through the `par()` function. Values set in this manner will be in effect for
the rest of the session or until they're changed, but not all high-level
plotting functions allow us to specify all possible graphical parameters. The
remainder of this blog will describe many important graphical parameters.

### Symbols and lines

We can use graphical parameters to specify the plotting symbols and lines used
in graphs. The relevant parameters are shown in the following table.

<table style="margin:auto; text-align:center">
  <caption style = "text-align: left; font-size: 80%">
      <b>Table 1. Parameters for specifying symbols and lines</b>
  </caption>
  <tr>
    <th>
      <b>Parameter</b>
    </th>
    <th>
      <b>Description</b>
    </th>
  </tr>
  <tr>
    <td>
      <code>pch</code>
    </td>
    <td>Specifies the symbol to use when plotting points.</td>
  </tr>
  <tr>
    <td>
      <code>cex</code>
    </td>
    <td>Specifies the symbol size. <br> 1 = default, 1.5 is 50% larger, 0.5 is
    50% smaller, and so forth.</td>
  </tr>
  <tr>
    <td>
      <code>lty</code>
    </td>
    <td>Specifies the line type.</td>
  </tr>
  <tr>
    <td>
      <code>lwd</code>
    </td>
    <td>Specifies the line width. It's expressed relative to the default <br>
    (1 = default). For example, 2 generates a line twice as wide as the default.
    </td>
  </tr>
</table>

Plotting symbols specified with the `pch` parameter, line types specified with
the `lty` parameter.

<p align="center">
  <img alt="plot symbols pch & line types lty"
  src="{{ site.baseurl }}/images/20170415-pch-lty.png"/>
</p>

### Colors

There are several color-related parameters in R. The following table shows some
of the common ones.

<table style="margin:auto; text-align:center">
  <caption style = "text-align: left; font-size: 80%">
      <b>Table 2. Parameters for specifying colors</b>
  </caption>
  <tr>
    <th>
      <b>Parameter</b>
    </th>
    <th>
      <b>Description</b>
    </th>
  </tr>
  <tr>
    <td>
      <code>col</code>
    </td>
    <td>Default plotting color.</td>
  </tr>
  <tr>
    <td>
      <code>col.axis</code>
    </td>
    <td>Color for axis text.</td>
  </tr>
  <tr>
    <td>
      <code>col.lab</code>
    </td>
    <td>Color for axis labels.</td>
  </tr>
  <tr>
    <td>
      <code>col.main</code>
    </td>
    <td>Color for titles.</td>
  </tr>
  <tr>
    <td>
      <code>col.sub</code>
    </td>
    <td>Color for subtitles.</td>
  </tr>
  <tr>
    <td>
      <code>fg</code>
    </td>
    <td>Color for the plot's foreground.</td>
  </tr>
  <tr>
    <td>
      <code>bg</code>
    </td>
    <td>Color for the plot's background.</td>
  </tr>
</table>

We can specify colors in R by index, name, hexadecimal, RGB, or HSV. For
example, `col = 1`, `col = "white"`, `col = "#FFFFFF"`, `col = rgb(1, 1, 1)` and
`col = hsv(0, 0, 1)` are equivalent ways of specifying the color white. The
function `colors()` returns all avaiable color names. Moreover, R has a number
of functions that can be used to create vectors of contiguous colors. These
include `rainbow()`, `heat.colors()`, `terrain.colors()`, `topo.colors()` and
`cm.colors()`.

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <code>rainbow()</code>
    </th>
    <th>
      <code>heat.colors()</code>
    </th>
    <th>
      <code>terrain.colors()</code>
    </th>
  </tr>
  <tr>
    <td>
      <img alt="rainbow colors" 
      src="{{ site.baseurl }}/images/20170415-rainbow.png"/>
    </td>
    <td>
      <img alt="heat colors" 
      src="{{ site.baseurl }}/images/20170415-heat.png"/>
    </td>
    <td>
      <img alt="terrain colors" 
      src="{{ site.baseurl }}/images/20170415-terrain.png"/>
    </td>
  </tr>
</table>

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <code>topo.colors()</code>
    </th>
    <th>
      <code>cm.colors()</code>
    </th>
  </tr>
  <tr>
    <td>
      <img alt="topo colors" 
      src="{{ site.baseurl }}/images/20170415-topo.png"/>
    </td>
    <td>
      <img alt="cm colors" 
      src="{{ site.baseurl }}/images/20170415-cm.png"/>
    </td>
  </tr>
</table>

Furthermore, the `RColorBrewer` package is particularly popular for creating
attractive color palettes, use the `brewer.pal(n, name)` function to generate a
vector of colors. For the parameter _name_, all values are shown below.

<p align="center">
  <img alt="RColorBrewer color palette"
  src="{{ site.baseurl }}/images/20170415-rcolorbrewer.png"/>
</p>

### Text characteristics

Graphic parameters are also used to specify text size, font, and style.
Parameters controlling text size are explained in table 3. Font family and style
can be controlled with font options (table 4).

<table style="margin:auto; text-align:center">
  <caption style = "text-align: left; font-size: 80%">
      <b>Table 3. Parameters specifying text size</b>
  </caption>
  <tr>
    <th>
      <b>Parameter</b>
    </th>
    <th>
      <b>Description</b>
    </th>
  </tr>
  <tr>
    <td>
      <code>cex</code>
    </td>
    <td>Number indicating the amount by which plotted text should be scaled
    relative to the default. <br> 1 = default, 1.5 is 50% larger, 0.5 is 50%
    smaller, and so forth.</td>
  </tr>
  <tr>
    <td>
      <code>cex.axis</code>
    </td>
    <td>Magnification of axis text relative to <code>cex</code>.</td>
  </tr>
  <tr>
    <td>
      <code>cex.lab</code>
    </td>
    <td>Magnification of axis labels relative to <code>cex</code>.</td>
  </tr>
  <tr>
    <td>
      <code>cex.main</code>
    </td>
    <td>Magnification of titles relative to <code>cex</code>.</td>
  </tr>
  <tr>
    <td>
      <code>cex.sub</code>
    </td>
    <td>Magnification of subtitles relative to <code>cex</code>.</td>
  </tr>
</table>

<br>

<table style="margin:auto; text-align:center">
  <caption style = "text-align: left; font-size: 80%">
      <b>Table 4. Parameters specifying font family, size, and style</b>
  </caption>
  <tr>
    <th>
      <b>Parameter</b>
    </th>
    <th>
      <b>Description</b>
    </th>
  </tr>
  <tr>
    <td>
      <code>font</code>
    </td>
    <td>Integer specifying the font to use for plotted text. <br> 1 = plain,
    2 = bold, 3 = italic, 4 = bold italic, and <br> 5 = symbol (in Adobe symbol
    encoding).</td>
  </tr>
  <tr>
    <td>
      <code>font.axis</code>
    </td>
    <td>Font for axis text.</td>
  </tr>
  <tr>
    <td>
      <code>font.lab</code>
    </td>
    <td>Font for axis labels.</td>
  </tr>
  <tr>
    <td>
      <code>font.main</code>
    </td>
    <td>Font for titles.</td>
  </tr>
  <tr>
    <td>
      <code>font.sub</code>
    </td>
    <td>Font for subtitles.</td>
  </tr>
  <tr>
    <td>
      <code>ps</code>
    </td>
    <td>Font point size (roughly 1/72 inch). The text size = <code>ps</code>*
    <code>cex</code>.</td>
  </tr>
  <tr>
    <td>
      <code>family</code>
    </td>
    <td>Font family for drawing text. Standard values are <br> <code>serif</code>,
    <code>sans</code>, and <code>mono</code>.</td>
  </tr>
</table>

### Graph and margin dimensions

Finally, we can control the plot dimensions and margin sizes using the
parameters listed in table 5.

<table style="margin:auto; text-align:center">
  <caption style = "text-align: left; font-size: 80%">
      <b>Table 5. Parameters specifying font family, size, and style</b>
  </caption>
  <tr>
    <th>
      <b>Parameter</b>
    </th>
    <th>
      <b>Description</b>
    </th>
  </tr>
  <tr>
    <td>
      <code>pin</code>
    </td>
    <td>Plot dimensions (width, height) in inches.</td>
  </tr>
  <tr>
    <td>
      <code>mai</code>
    </td>
    <td>Numerical vector indicating margin size, where <br> <code>c(bottom, left,
    top, right)</code> is expressed in inches.</td>
  </tr>
  <tr>
    <td>
      <code>mar</code>
    </td>
    <td>Numerical vector indicating margin size, where <br> <code>c(bottom, left,
    top, right)</code> is expressed in lines. <br>The default is <code>c(5, 4,
    4, 2) + 0.1</code>.</td>
  </tr>
</table>

In the next blog, we'll turn to the customization of text annotations, and look
at ways to combine more than one graph into a single image.
