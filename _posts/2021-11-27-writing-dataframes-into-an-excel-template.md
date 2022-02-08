---
layout:      post
title:       "Writing dataframes into an Excel template"
lang:        en
date:        "2021-11-27 12:07:17 +0100"
tags:        [python3, excel]
comments:    true
excerpt:     >
    People who are familiar with openpyxl know that we can use it to read/write
    Excel 2010 xlsx/xlsm/xltx/xltm files. In this blog, I will show you how to
    write values into an Excel template.
cover:       /images/20211127-python-excel.jpeg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---
## Introduction
People who are familiar with `openpyxl` know that we can use it to read/write
Excel 2010 xlsx/xlsm/xltx/xltm files. As I presented in [this blog][manip-excel-with-openpyxl],
we can create a workbook, assign values to some cells, apply number formats,
merge cells, etc. However, if we need to create an Excel dashboard as the
following, should we accomplish all formats with `openpyxl`?

<p align="center">
  <img alt="20211127-portfolio-dashboard"
  src="{{ site.baseurl }}/images/20211127-portfolio-dashboard.png"/>
</p>

For the question above, we can resolve it from another point of view: we can
create an Excel template with the fixed format, such as dashboard title and logo,
subtitles, then write values into this template. In this blog, I'll show you how
to do this with the following points:
- Context
- Write data into the template

## Context
We have an Excel template named "template.xlsx", which contains two worksheets
"category" and "product":

<p align="center">
  <img alt="20211127-category-template"
  src="{{ site.baseurl }}/images/20211127-category-template.PNG"/>
</p>

The worksheet "category" shows the performance of each category with different
indicators like turnover, volume, number of clients, etc.

<p align="center">
  <img alt="20211127-product-template"
  src="{{ site.baseurl }}/images/20211127-product-template.PNG"/>
</p>

The worksheet "product" shows the performance of each product with the same
indicators.

And what we need to insert into these two worksheets are three pandas dataframes:
classic_indicators_df, other_indicators_df and products_detail_df.

<p align="center">
  <img alt="20211127-category-df"
  src="{{ site.baseurl }}/images/20211127-category-df.png"/>
</p>

<p align="center">
  <img alt="20211127-product-df"
  src="{{ site.baseurl }}/images/20211127-product-df.PNG"/>
</p>

## Write data into the template
With all data preparation, the next target is writing the three dataframes into
the template with several steps:
- Load the workbook
- Create a writer
- Write dataframe into the template

### Load the workbook
```python
template = openpyxl.load_workbook('./template.xlsx')
```
We load the template with `openpyxl.load_workbook` by indicating the path.

### Create a writer
```python
import pandas as pd

out_path = './final_report.xlsx'

writer = pd.ExcelWriter(out_path)
writer.book = template
```
We set the writer with `pandas.ExcelWriter` that allows to write DataFrame
objects into excel sheets, and set the template file as the writer's workbook.

### Write dataframe into the template
```
import openpyxl
from openpyxl.styles.borders import Border, Side
import string

def set_border(ws, cell_range):
    rows = ws[cell_range]
    side = Side(border_style='thin', color="FF000000")

    rows = list(rows)
    max_y = len(rows) - 1  # index of the last row
    for pos_y, cells in enumerate(rows):
        max_x = len(cells) - 1  # index of the last cell
        for pos_x, cell in enumerate(cells):
            border = Border(
                left=cell.border.left,
                right=cell.border.right,
                top=cell.border.top,
                bottom=cell.border.bottom
            )
            border.left = side
            border.right = side
            border.top = side
            border.bottom = side
            
            cell.border = border
```
Before writing into the template, I create a function `set_border()` by using
`Side()` and `Border()` to set borders for each cell in the given range.

```
df_sheet_list = [(classic_indicators_df, 'category'),
                 (other_indicators_df, 'category'),
                 (products_detail_df, 'product')]

for (df, sht) in df_sheet_list:
    templ_sht = template[sht]
    writer.sheets = {templ_sht.title:templ_sht}

    if df is classic_indicators_df:
        classic_indicators_df.to_excel(writer, sheet_name=sht, index=False,
                                       header=False, startrow=13, startcol=2)
        set_border(writer.sheets[sht], f"C14:G{14-1+len(df)}")
    elif df is other_indicators_df:
        other_indicators_df.to_excel(writer, sheet_name=sht, index=False,
                                       header=False, startrow=13, startcol=8)
        set_border(writer.sheets[sht], f"I14:M{14-1+len(df)}")
    elif df is products_detail_df:
        products_detail_df.to_excel(writer, sheet_name=sht, index=False,
                                       header=False, startrow=12, startcol=4)
        set_border(writer.sheets[sht], f"E13:K{13-1+len(df)}")

writer.save()
```
We assign the sheet where we will insert the dateframe to `writer.sheets`.
Then we write the dataframe with `.to_excel` by specifying the writer we use,
the worksheet that we want to insert, and the start row and the start column
with integers, after all these steps, we save the file with `writer.save()`.

If you are curious about the scripts, you will find them [here][notebook].

## References
- "What’s new in Excel 365?", _laptrinhx.com_. [Online]. Available: [https://laptrinhx.com/what-s-new-in-excel-365-589177363/#][r1]
- "SALES KPI REPORT", _thesmallman.com_. [Online]. Available: [https://www.thesmallman.com/premium/key-performance-indicators][r2]
- "Howard Tucan", _miro.medium.com_. [Online]. Available: [https://miro.medium.com/max/1400/1*hpMdyM6QNJGix73T-sc8vw.jpeg][image]

[manip-excel-with-openpyxl]: https://jingwen-z.github.io/how-to-munipulate-excel-workbook-by-python/
[r1]: https://laptrinhx.com/what-s-new-in-excel-365-589177363/#
[r2]: https://www.thesmallman.com/premium/key-performance-indicators
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/learn_openpyxl/demo_insert_values_into_excel_template.ipynb
[image]: https://miro.medium.com/max/1400/1*hpMdyM6QNJGix73T-sc8vw.jpeg
