---
layout:      post
title:       "How to manipulate excel workbook by Python?"
date:        "2018-06-19 09:10:03 +0200"
comments:    true
---

During the work we need to automate some reports frequently, including
manipulating excel workbook. In this blog I will introduce some basic
manipulations on excel workbook by [`openpyxl`][openpyxl] package.

In the following, I will create a workbook, write values into one worksheet, and
some handling like merging cells, set font size/color/type, set background color,
set borders, etc.

Before coding, I'll import all packages we need.

{% highlight python %}
import openpyxl
from openpyxl.styles import Alignment
from openpyxl.styles import Font
from openpyxl.styles import PatternFill
from openpyxl.styles.borders import Border, Side
from openpyxl.workbook import Workbook
{% endhighlight %}

Now, let's start!

{% highlight python %}
# create a workbook
wb = Workbook()
dest_filename = 'test.xlsx'

ws_test = wb.active
ws_test.title = 'test_wksht'
{% endhighlight %}

`Workbook()` helps us to create a workbook, use `active` module to assign actual
worksheet and use `title` module to name it.

{% highlight python %}
# write values
VAL_POS_MAP = {'Merge D1:E2': 'D1',
               'Id': 'C4',
               'T1': 'C5',
               'T2': 'C6',
               'CliendId': 'D4',
               'C1': 'D5',
               'C2': 'D6',
               'Volumn': 'E4',
               567213: 'E5',
               6784: 'E6',
               'Turnover': 'F4',
               234231: 'F5',
               32145: 'F6'}
               
for value, pos in VAL_POS_MAP.items():
    ws_test[pos] = value
{% endhighlight %}

We can write values into specified cells with pattern `worksheet[cells] = value`.
Here I iterate a map, who contains values and cells' positions, to write values
iteratively.

{% highlight python %}
# merge C1:D2
ws_test.merge_cells('D1:E2')
{% endhighlight %}

Then I merge cells from D1 to E2 with `worksheet.merge_cells`.

{% highlight python %}
# font (size, type, bold, italic)
GLOBAL_TITLE_FONT = Font(name='Calibri',
                         size=24,
                         bold=True,
                         italic=False,
                         vertAlign=None,
                         underline='none',
                         strike=False,
                         color='e64117')

SUBTITLE_FONT = Font(name='Calibri',
                     size=14,
                     bold=True,
                     italic=False,
                     vertAlign=None,
                     underline='none',
                     strike=False,
                     color='000000')

SZ14_FONT = Font(name='Calibri',
                 size=11,
                 bold=False,
                 italic=False,
                 vertAlign=None,
                 underline='none',
                 strike=False,
                 color='000000')

BG_YELLOW_LIST = ['C4', 'D4', 'E4', 'F4']
CONTENT_LIST = ['C5', 'C6', 'D5', 'D6', 'E5', 'E6', 'F5', 'F6']

ws_test['D1'].font = GLOBAL_TITLE_FONT

for pos in BG_YELLOW_LIST:
    ws_test[pos].font = SUBTITLE_FONT

for pos in CONTENT_LIST:
    ws_test[pos].font = SZ14_FONT
{% endhighlight %}

According to `openpyxl`, we can set font styles(size/color/type) by different
arguments of `Font()`. Then assign `worksheet[cells].font` equals to `Font()`
setting. 

{% highlight python %}
# number format
EURO_LIST = ['F5', 'F6']
SEP_K_LIST = ['E5', 'E6']

for pos in EURO_LIST:
    ws_test[pos].number_format = '#,##0€'

for pos in SEP_K_LIST:
    ws_test[pos].number_format = '#,##0'
{% endhighlight %}

If you want to set numbers' format, like currency or display a thousands
separator, you can specify module `number_format`'s value.

{% highlight python %}
# background colors
for pos in BG_YELLOW_LIST:
    ws_test[pos].fill = PatternFill(start_color="feedc6",
                                    end_color="feedc6",
                                    fill_type="solid")
{% endhighlight %}

When we want to highlight header, adding the background color might be a good
idea. Then we can assign `worksheet[cell].fill` to `PatternFill()`, with RBG
colors. 

{% highlight python %}
# center characters
for row_cells in ws_test.iter_rows():
    for cell in row_cells:
        cell.alignment = Alignment(horizontal='center',
                                   vertical='center')
{% endhighlight %}

Moreover, I wanted to center horizontal and vertical alignment for all cells. So
I iterated all cells, and set their `alignment` module as _center_.

{% highlight python %}
# cell size
for col in ['D', 'E']:
    ws_test.column_dimensions[col].width = 20

ws_test.column_dimensions['F'].width = 12
{% endhighlight %}

Sometimes, a cell contains lots of characters and cannot be displayed by default.
In this case, if you want to display all, you can set cell's width, with pattern
`worksheet.column_dimensions[column].width`.

{% highlight python %}
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
            if pos_x == 0:
                border.left = side
            if pos_x == max_x:
                border.right = side
            if pos_y == 0:
                border.top = side
            if pos_y == max_y:
                border.bottom = side

            # set new border only if it's one of the edge cells
            if pos_x == 0 or pos_x == max_x or pos_y == 0 or pos_y == max_y:
                cell.border = border

# border
for pos in BORDER_LIST:
    set_border(ws_test, pos)
{% endhighlight %}

Next, I used a function `set_border()` that found on [stackoverflow][stackoverflow].
In this function, it used `Side()` and `Border()` to set outside borders for
given cells.

{% highlight python %}
ws_test.sheet_view.showGridLines = False
ws_test.sheet_view.zoomScale = 80
{% endhighlight %}

Furthermore, if you want to hide all grid lines or set zoom scale, you can use
`worksheet.sheet_view.showGridLines` or `worksheet.sheet_view.zoomScale`.

{% highlight python %}
# create named range
wb.create_named_range('ZoneId', ws_test, '$C$4:$C$6')
{% endhighlight %}

`workbook.create_named_range()` create named ranges from C4 to C6, in _ws_test_
worksheet, named 'ZoneId'.

{% highlight python %}
# save
wb.save(dest_filename)
{% endhighlight %}

Finally, save the workbook to given path with `workbook.save()`.

Voila, result as follows:

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180619-openpyxl.PNG"/>
</p>

[openpyxl]: https://openpyxl.readthedocs.io/en/stable
[stackoverflow]: https://stackoverflow.com/questions/34520764/apply-border-to-range-of-cells-using-openpyxl
