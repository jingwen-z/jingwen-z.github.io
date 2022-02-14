---
layout:      post
title:       "Python PEP 328: import and build package"
lang:        en
date:        "2018-08-04 18:56:28 +0200"
tags:        [python3, PEP-328]
permalink:   /python-pep-328-import-and-build-package/
comments:    true
excerpt:     >
    This blog follows PEP 328 to specify how to import package absolutely or
    relatively in Python and how to build package as well.
cover:             /images/20180804-python.jpg
img_width:         1280
img_height:        853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---
Module and package are core of large programs. In this blog, I will talk about
how to write long `import` statements, how to import packages absolutely and
relatively, and how to build your own package/API.

The import statement has two problems:

- Long `import` statements can be difficult to write, requiring various
contortions to fit Pythonic style guidelines.

- Imports can be ambiguous in the face of packages; within a package, it's not
clear whether `import foo` refers to a module within the package or some module
outside the package.

For the first problem, it is proposed that parentheses be permitted to enclose
multiple names, thus allowing Python's standard mechanisms for multi-line values
to apply. For the second problem, it is proposed that all `import` statements be
absolute by default with special syntax for accessing package-relative imports.

## Long `import` statement
- Write a long line with backslash continuations
{% highlight python %}
from Tkinter import Tk, Frame, Button, Entry, Canvas, Text, \
    LEFT, DISABLED, NORMAL, RIDGE, END
{% endhighlight %}

- Write multiple `import` statements
{% highlight python %}
from Tkinter import Tk, Frame, Button, Entry, Canvas, Text
from Tkinter import LEFT, DISABLED, NORMAL, RIDGE, END
{% endhighlight %}

- Use Python's standard grouping mechanism (parentheses) 
{% highlight python %}
from Tkinter import (Tk, Frame, Button, Entry, Canvas, Text,
    LEFT, DISABLED, NORMAL, RIDGE, END)
{% endhighlight %}

## Absolute imports
As Python's library expands, more and more existing package internal modules
suddenly shadow standard library modules by accident. It's a particularly
difficult problem inside packages because there's no way to specify which module
is meant. To resolve the ambiguity, it is proposed that `foo` will always be a
module or package reachable from `sys.path`. This is called an absolute import.

{% highlight python %}
import foo
import sound.effects.echo
{% endhighlight %}

## Relative imports
When packages are structured into subpackages, you can use absolute imports to
refer to submodules of siblings packages. If the imported module is not found in
the current package (the package of which the current module is a submodule),
the `import` statement looks for a top-level module with the given name.

You can write explicit relative imports with the `from module import name` form
of import statement. These explicit relative imports use leading dots to
indicate the current and parent packages involved in the relative import. For
example,
{% highlight python %}
from . import echo
from .. import formats
from ..filters import equalizer
{% endhighlight %}

## Build and import modules
Next, I'll show you how to organise and build a package, and how to import them.

### Build Python modules
Working with Python packages is really simple. All you need to do is:
- Create a directory and give it your package's name.
- Put your classes in it.
- Create a `__init__.py` file in the directory

```
$ tree
.
├── mypackage
│   ├── A
│   │   ├── __init__.py
│   │   ├── grok.py
│   │   └── spam.py
│   ├── __init__.py
│   └── job.py
```

### Import modules
In the example above, in order to import `grok.py` and `spam.py` in `job.py`, we can write:
{% highlight python %}
# mypackage/job.py
import .A.grok
from .A import spam
{% endhighlight %}

**Absolute imports**
```
$ tree
.
├── mypackage
│   ├── A
│   │   ├── __init__.py
│   │   ├── grok.py
│   │   └── spam.py
│   ├── B
│   │   ├── __init__.py
│   │   └── bar.py
│   └── __init__.py
```

{% highlight python %}
# mypackage/A/spam.py
from mypackage.A import grok # OK
from . import grok # OK
import grok # Error (not found)
{% endhighlight %}

Using absolute imports can ensure that you import the right package since you
hard code the package absolute path. However, if you rename the package name,
you have to check and update your scripts, which means updating scripts brings
difficulties. In this case, you can import packages relatively.

**Relative import**
{% highlight python %}
# mypackage/A/spam.py
from . import grok
from ..B import bar
{% endhighlight %}

If we want to import module `grok` in `spam`, since they are siblings, we can
import it from `.`, which means from the same directory; if we want to import
module `bar` in `spam`, since they are not siblings, we can import from `..B`,
which equals to `../B`.

## Reference
- [PEP 328 -- Imports: Multi-Line and Absolute/Relative][PEP328]
- [Python 3.6 tutorial: 6. Modules][Py3.6 modules]
- [《Python Cookbook》3rd 中文版3.0.0, 第十章：模块与包][Chinese version]
- [How to Create a Python Package][build package]
- David Clode, "A green tree python in a typical pose", _unsplash.com_. [Online]. Available: [https://unsplash.com/photos/5uU8HSpfwkI][backgroud-img]


[PEP328]: https://www.python.org/dev/peps/pep-0328
[Py3.6 modules]: https://docs.python.org/3.6/tutorial/modules.html
[Chinese version]: http://python3-cookbook.readthedocs.io/zh_CN/latest/chapters/p10_modules_and_packages.html
[build package]: https://www.pythoncentral.io/how-to-create-a-python-package
[backgroud-img]: https://unsplash.com/photos/5uU8HSpfwkI
