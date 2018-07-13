---
layout:      post
title:       "How to play with regular expression via Python?"
date:        "2018-07-10 18:31:21 +0200"
comments:    true
---

_Regular expressions_ provide a flexible way to search or match string patterns
in text. A single expression, commonly called a _regex_, is a string formed
according to the regular expression language.Python's built-in `re` module is
responsible for applying regular expressions to strings.

## Syntax
### Special characters
Special characters either stand for classes of ordinary characters, or affect
how the regular expressions around them are interpreted.

- `.`
 (Dot.) In the default mode, this matches any character except a newline. If the
 `DOTALL` flag has been specified, this matches any character including a
 newline.
- `^`
 (Caret.) Matches the start of the string, and in `MULTILINE` mode also matches
 immediately after each newline.
- `$`
  Matches the end of the string or just before the newline at the end of the
  string.
- `*`
  Causes the resulting RE to match _0 or more_ repetitions of the preceding RE, as
  many repetitions as are possible.
- `+`
  Causes the resulting RE to match _1 or more_ repetitions of the preceding RE.
- `?`
  Causes the resulting RE to match _0 or 1_ repetition of the preceding RE.
- `{m,n}`
  Causes the resulting RE to match from m to n repetitions of the preceding RE,
  attempting to match as many repetitions as possible. For example, a{3,5} will
  match from 3 to 5 'a' characters. 
- `[]`
  Used to indicate a set of characters.(character class)
- `|`
  `A|B`, where A and B can be arbitrary REs, creates a regular expression that
  will match either A or B. 
- `()`
  Matches whatever regular expression is inside the parentheses, and indicates
  the start and end of a group.

### Special sequences
Following sequences can be included inside a character class.
- `\d`
  Matches any decimal digit; this is equivalent to the class `[0-9]`.
- `\D`
  Matches any non-digit character; this is equivalent to the class `[^0-9]`.
- `\s`
  Matches any whitespace character; this is equivalent to the class `[ \t\n\r\f\v]`.
- `\S`
  Matches any non-whitespace character; this is equivalent to the class `[^ \t\n\r\f\v]`.
- `\w`
  Matches any alphanumeric character; this is equivalent to the class `[a-zA-Z0-9_]`.
- `\W`
  Matches any non-alphanumeric character; this is equivalent to the class `[^a-zA-Z0-9_]`.

### White space characters
- `\n` new line
- `\s` space
- `\t` tab
- `\e` escape
- `\f` form feed
- `\r` return

### Use '\\' to escape special characters
`. ^ $ * + ? [ ] ( ) { } | \`

## Examples
{% highlight python %}
import re
{% endhighlight %}

### Any number
{% highlight python %}
>>> value = '''
... One is 1, ten is 10, one hundred is 100.
... '''
>>> p = r'\d{1,3}'
>>> re.findall(p, value)
['1', '10', '100']

{% endhighlight %}

`\d` matches decimal digit, `{1,3}` stands for length is 1 to 3. In the "value",
we find 1, 10 and 100.

### Any character
{% highlight python %}
>>> value = '''
... One is 1, ten is 10, one hundred is 100.
... '''
>>> p = r'\w+'
>>> re.findall(p, value)
['One', 'is', '1', 'ten', 'is', '10', 'one', 'hundred', 'is', '100']

{% endhighlight %}

`\w+` matches 1 or more alphanumeric characters, so we can find all words but
spaces and punctuations.

### Match 0 or more
{% highlight python %}
>>> value = 'One = 1.'
>>> p = r'\d*'
>>> re.findall(p, value)
['', '', '', '', '', '', '1', '', '']

{% endhighlight %}

`\d*` matches 0 or more digits, so we can find a '1' and others are `''`.

### Match 1 or more
{% highlight python %}
>>> value = 'One = 1.'
>>> p = r'\d+'
>>> re.findall(p, value)
['1']

{% endhighlight %}

`\d*` matches at least 1 digits, so we can find only '1'.

### Match 0 or 1
{% highlight python %}
>>> value = 'One = 1.'
>>> p = r'\W?'
>>> re.findall(p, value)
['', '', '', ' ', '=', ' ', '', '.', '']

{% endhighlight %}

`\W?` means 0 or 1 non-alphanumeric character, so we get '', '=', ' ', '.'.

### Match starting and ending
{% highlight python %}
>>> p = r'^[^1]{2}[^3]$'
>>> re.findall(p, '1=2')
[]
>>> re.findall(p, '212')
[]
>>> re.findall(p, '2=1')
['2=1']
>>> re.findall(p, '221')
['221']

{% endhighlight %}

`^1` means not 1, so `^[^1]{2}[^3]$` matches 3 characters which don't start with
1 and don't end with 3.

### Match character class
{% highlight python %}
>>> p = r'^[A-Z]+[a-z]+'
>>> re.findall(p, 'Apple')
['Apple']
>>> re.findall(p, 'APPLE')
[]
>>> re.findall(p, 'apple')
[]

{% endhighlight %}

This pattern means at least 2 characters which start with 1 or more upper-case
letter(s), followed with 1 or more lower-case letter(s).

### Match group
{% highlight python %}
>>> p = r'([a-z0-9]+)@([a-z]*)\.([a-z]{2,4})'
>>> re.findall(p, 'dfsdfa567@gmail.comm')
[('dfsdfa567', 'gmail', 'comm')]
>>> re.findall(p, 'DFSdfa567@gmail.fr')
[('dfa567', 'gmail', 'fr')]

{% endhighlight %}

In the above example, I want to separate e-mail address into 3 parts, 1st part
is a particular email account (before "@"), the second is second-level domain
(after "@") and the third part, top-level domain. Since I specify the 1st part
only contains lower-case letters or numeric characters, so for the second
example, regular expression doesn't match the first 3 upper-case letters.

### Find in dataframe
{% highlight python %}
>>> import pandas as pd

>>> df = pd.DataFrame({'Name': ['Amy', 'Ben', 'Christine', 'David'],
...                    'Birthday': ['1980-02-12', '2013-02-14',
...                                 '1983-11-23', '1969-05-30'],
...                    'Email': ['amy.l@hotmail.com',
...                              'benmartni@gmail.fr',
...                              'c.mousse@example.com',
...                              'd_zhang@fp.fr']},
...                    columns=['Name', 'Birthday', 'Email'])
>>> df
        Name    Birthday                 Email
0        Amy  1980-02-12     amy.l@hotmail.com
1        Ben  2013-02-14    benmartni@gmail.fr
2  Christine  1983-11-23  c.mousse@example.com
3      David  1969-05-30         d_zhang@fp.fr

>>> p = r'^[a-z]+@[a-z]+\.[a-z]{2,3}'

>>> df['Email'].apply(lambda x: re.findall(p, x))
0                      []
1    [benmartni@gmail.fr]
2                      []
3                      []
Name: Email, dtype: object

{% endhighlight %}

Moreover, we can also find something with regex pattern. In this example, I
created a dataframe, which contains 3 columns, "Name", "Birthday' and "Email".
Now I want to find e-mail address whose account and second-level domain contain
only lower-case letters, and its top-level domain contains 2 or 3 lower-case
letters. Thus, among 4 e-mail addresses, the second one satisfies our pattern.

### Use regex to replace character in dataframe
{% highlight python %}
>>> p = r'[@]'
>>> df['Email'].apply(lambda x: re.sub(p, '[at]', x))
0       amy.l[at]hotmail.com
1      benmartni[at]gmail.fr
2    c.mousse[at]example.com
3           d_zhang[at]fp.fr
Name: Email, dtype: object

{% endhighlight %}

E-mail addresses contain "@" to specify the second-level. However, we want to
replace it to "[at]" in the dataframe. We can use [`re.sub()`][re_sub] to
realise it.

There is much more to regular expressions in Python, we can find most of them
[here][re].

## Reference
- [Python 3 Programming Tutorial - Regular Expressions / Regex with re][r1]
- [stackoverflow - applying regex to a pandas dataframe][r2]
- Wes McKinney. 2017. "Chapter 7 Data Cleaning and Preparation" _Python for Data
Analysis DATA WRANGLING WITH PANDAS, NUMPY, AND IPYTHON_ p 213-216


[re_sub]: https://docs.python.org/3/library/re.html#module-contents
[re]: https://docs.python.org/3/library/re.html
[r1]: https://www.youtube.com/watch?v=sZyAn2TW7GY&t=927s
[r2]: https://stackoverflow.com/questions/25292838/applying-regex-to-a-pandas-dataframe
