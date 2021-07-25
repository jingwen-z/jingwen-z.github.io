---
layout:      post
title:       "How to create a virtual environment by Python?"
lang:        en
date:        "2019-07-23 20:57:21 +0200"
tags:        [python3, virtual-environment, jupyter-notebook]
permalink:         /how-to-create-a-virtual-environment-by-python/
comments:    true
excerpt:     >
    In this blog, I talked about why we create a virtual environment, how to
    create a virtual environment by Python and how to use virtual environment
    in Jupyter Notebook.
cover:       /images/20190723-venv.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Imagine that you are creating a project with python, and you need to import a
package which is not the same version as other project, what should we in this
situation? Maybe creating a virtual environment for this project is a good
choice. In this blog, I'll talk about virtual environment with the following
points:
- Why we create a virtual environment?
- How to create a virtual environment by Python?
- How to use virtual environment in Jupyter Notebook?


## Why we create a virtual environment?
In case of what I mentioned at the beginning, the virtual environment allows
you to use a certain version of a module for one project and another version
for another project: if you install the module system-wide and don’t use venv,
then you can only use one version of the module.

In a word, virtual environment is able to ensure your modules' version for a
python project.

## How to create a virtual environment by Python?
Before creating a virtual environment by Python, you should make sure that you
have installed `pip`. For creating the virtual environment, we firstly install
`virtualenv` module:

{% highlight python %}
pip install --user --upgrade virtualenv
{% endhighlight %}

Now you can create a virtual environment in the corresponding directory by
typing:

{% highlight python %}
python -m venv _venvname
{% endhighlight %}

<p align="center">
  <img alt="Creating a virtual environment"
  src="{{ site.baseurl }}/images/20190723-venv-1.PNG"/>
</p>

`_venvname` can be replaced by the name you want for your venv. In my example,
the name of venv is "_restauration_venv".

After creating your venv, you can activate it with:

{% highlight python %}
.\_venvname\Scripts\activate.bat
{% endhighlight %}

and install the modules you need:

{% highlight python %}
pip install -r requirements.txt
{% endhighlight %}

<p align="center">
  <img alt="Activate the virtual environment"
  src="{{ site.baseurl }}/images/20190723-venv-2.PNG"/>
</p>

Before leaving, you need to deactivate the venv:

{% highlight python %}
.\_venvname\Scripts\deactivate.bat
{% endhighlight %}

<p align="center">
  <img alt="Deactivate the virtual environment"
  src="{{ site.baseurl }}/images/20190723-venv-6.PNG"/>
</p>

## How to use virtual environment in Jupyter Notebook?
If you want to use virtual environment in Jupyter Notebook, you need to add a
kernel with it. First, activate your virtual environment; then install
`ipykernel`:

{% highlight python %}
pip install --user ipykernel
{% endhighlight %}

Now you can add your venv to Jupyter Notebook:

{% highlight python %}
ipython kernel install --user --name=_venvname 
{% endhighlight %}

<p align="center">
  <img alt="Create a kernel"
  src="{{ site.baseurl }}/images/20190723-venv-3.PNG"/>
</p>

Next, you can choose your kernel as following:

<p align="center">
  <img alt="Choose the kernel"
  src="{{ site.baseurl }}/images/20190723-venv-4.PNG"/>
</p>

As soon as you choose, the kernel will update at the right top corner:

<p align="center">
  <img alt="Kernel updated"
  src="{{ site.baseurl }}/images/20190723-venv-5.PNG"/>
</p>

## Conclusion
In this blog, I talked about why we create a virtual environment, how to create
a virtual environment by Python and how to use virtual environment in Jupyter
Notebook. Hope it's useful for you.

## References
- Angelo Basile, "Using jupyter notebooks with a virtual environment", _anbasile.github.io_. [Online]. Available: [https://anbasile.github.io/programming/2017/06/25/jupyter-venv/][r1]
- Nikolai Janakiev, "Using Virtual Environments in Jupyter Notebook and Python", _Parametric Thoughts_. [Online]. Available: [https://janakiev.com/til/jupyter-virtual-envs/][r2]
- PIRO4D, "Virtual city utopia architecture", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/virtual-city-utopia-architecture-1589431/][r3]

[r1]: https://anbasile.github.io/programming/2017/06/25/jupyter-venv/
[r2]: https://janakiev.com/til/jupyter-virtual-envs/
[r3]: https://pixabay.com/photos/virtual-city-utopia-architecture-1589431/
