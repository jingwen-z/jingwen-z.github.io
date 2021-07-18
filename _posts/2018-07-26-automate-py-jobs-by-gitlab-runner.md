---
layout:             post
title:              "Automate python jobs by GitLab CI"
lang:        en
date:               2018-07-26 19:44:19 +0200
last_modified_at:   2018-08-05 09:02:31 +0200
tags:               [python3, CI]
comments:           true
excerpt:            >
    Automating python scripts to run by GitLab CI (Runner) needs to configure with
    ".gitlab-ci.yml" with multiple parts like image, stage, only, manage
    environments and settings on GitLab.
cover:       /images/20180726-runner-logo.png
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

This blog specifies how to automate python scripts to run by GitLab CI. In
the following, I will talk about each element of the configuration with
".gitlab-ci.yml", manage environments with anaconda and "environment.yml", and
settings on GitLab.

## Requirements
Before all, I would like to specify my working environment.

- OS: Debian 8
- GitLab Community Edition 10.8.0 ([GitLab Installation][GitLab install])
- GitLab Runner ([GitLab Runner Installation][GitLab runner install])
- Python 3.6.4

## Project structure
{% highlight bash %}
$ tree
.
├── .gitlab-ci.yml
├── environment.yml
└── weekly_job.py
{% endhighlight %}

## Using GitLab CI to configure your jobs
`.gitlab-ci.yml` is used by GitLab CI to manage your project's jobs. It is
placed in the root of your repository and contains definitions of how your
project should be built. On any push to your repository, GitLab will look for
the `.gitlab-ci.yml` file and start jobs on CI according to the contents of
the file, for that commit.

Following is one example:
{% highlight python %}
stages:
  - test
  - report

tests:
  image: "XXXX/miniconda-teradata-centos:latest"
  stage: test
  script:
    - pip install --upgrade pip
    - pip install -r requirements.txt
    - python -m unittest discover --verbose . "*_test.py"
  tags:
    - docker

weekly_job:
  image: "XXXX/miniconda-teradata-centos:latest"
  stage: report
  script:
    - conda env create -f jobs/environment.yml -q
    - source activate weekly_job
    - python jobs/weekly_job.py
  only:
    variables:
      - $weekly_job == "yes"
    refs:
      - schedules
      - master
  tags:
    - docker

{% endhighlight %}

In this example, there are several parts: `stages`, `image`, `stage`, `script`,
`only`, `tags`. I'll introduce them one by one.

### `stages`
`stages` is used to define stages that can be used by jobs and is defined
globally.

The specification of stages allows for having flexible multi stage pipelines.
The ordering of elements in stages defines the ordering of jobs' execution:

- Jobs of the same stage are run in parallel.
- Jobs of the next stage are run after the jobs from the previous stage complete
successfully.

In the example, we have 2 stages 'test' and 'report'. The jobs of stage 'test'
will run before running the jobs of stage 'report'.

### `image`
This allows to specify a custom Docker image that can be used for time of the
job. In our case, we need to use connect Teradata which officially supports only
CentOS and RHEL Linux distributions, so we built upon Jeremy Marshall's
[docker-teradata-client][docker-td] container and moble's [miniconda-centos][miniconda-centos]
container.

If the configuration interests you, more information [here][image config].


### `stage` 
`stage` is defined per-job and relies on stages which is defined globally. It
allows to group jobs into different stages, and jobs of the same stage are
executed in parallel.

In the example, the job in 'tests' corresponds the stage 'test', the job in
'weekly_job' corresponds the stage 'report'. 

### `script`
`script` is the only required keyword that a job needs. It's a shell script
which is executed by the CI.

{% highlight python %}
  script:
    - pip install --upgrade pip
    - pip install -r requirements.txt
    - python -m unittest discover --verbose . "*_test.py"
{% endhighlight %}

The scripts in 'tests' update pip, install packages in requirements.txt with pip,
and discover unit tests that ends with '_test.py'.

{% highlight python %}
  script:
    - conda env create -f jobs/environment.yml -q
    - source activate weekly_job
    - python jobs/weekly_job.py
{% endhighlight %}

We created a conda environment quietly from file jobs/environment.yml (I'll talk
about this file in the next part), then switching to the new environment which
is defined by the file, and run python script jobs/weekly_job.py by python.

### `only`
`only` defines the names of branches and tags for which the job will run.

There are a few rules that apply to the usage of job policy:
- `only` is inclusive. If only is defined in a job specification, the ref is
filtered by only.
- `only` allows the use of regular expressions.
- `only` allows to specify a repository path to filter jobs for forks.

In addition, `only` allows the use of special keywords. For example, `variables`
keyword is used to define variables expressions, in other words you can use
predefined variables / project / group or environment-scoped variables to define
an expression GitLab is going to evaluate in order to decide whether a job
should be created or not; using `refs` to specify that a branch is pushed and
scheduled pipelines.

{% highlight python %}
  only:
    variables:
      - $weekly_job == "yes"
    refs:
      - schedules
      - master
{% endhighlight %}

In the example, the job only runs when it satisfies the following conditions:
- value of variable $weekly_job is "yes"
  (use `%variable%` in windows batch and `$env:variable` in PowerShell)
- following the scheduled pipelines
- script is on the master branch

### `tags`
`tags` is used to select specific Runners from the list of all Runners that are
allowed to run this project.

## Managing environments
With conda, you can create, export, list, remove and update environments that
have different versions of Python and/or packages installed in them. Switching
or moving between environments is called activating the environment. You can
also share an environment file.

### Creating an environment from an environment.yml file
You can create an environment file manually to share with others.

{% highlight python %}
name: weekly_job
dependencies:
  - numpy
  - openpyxl
  - pandas
  - teradata==15.10.0.21
  - pip:
    - datetime
    - mailer == 0.8.1
{% endhighlight %}

An environment.yml file should specify environment's name with `name`, and
dependable packages with `dependencies`.

## GitLab settings
### Configuring GitLab CI
A Runner can be specific to a certain project or serve any project in GitLab CI.
A Runner that serves all projects is called a shared Runner. You can find more
information about configuration [here][Configuring GitLab Runners].

Before running, don't forget to go to **Settings > CI/CD > Runners settings**
to active your runner.

### Pipeline Schedules
Pipeline schedules can be used to run a pipeline at specific intervals, for
example every Monday at 7:00 for a certain branch.

In order to schedule a pipeline:
- Navigate to your project's **CI / CD > Schedules** and click the **New 
  Schedule** button.
- Fill in the form
- Hit **Save pipeline schedule** for the changes to take effect.

Moreover, You can pass any number of arbitrary variables and they will be
available in GitLab CI so that they can be used in your .GitLab-ci.yml file.

<p align="center">
  <img alt="pipeline schedules"
  src="{{ site.baseurl }}/images/20180726-pipelines-schedules-global.PNG"/>
</p>

<p align="center">
  <img alt="pipeline schedules"
  src="{{ site.baseurl }}/images/20180726-pipelines-schedules-detail.PNG"/>
</p>


## References
- [Project GitLab Runner on GitLab][logo]
- [Configuration of your jobs with .GitLab-ci.yml][GitLab-ci]
- [Managing environments][Managing environments]
- [Configuring GitLab Runners][Configuring GitLab Runners]
- [Pipeline Schedules][Pipeline Schedules]


[GitLab install]: https://about.GitLab.com/installation
[GitLab runner install]: https://docs.GitLab.com/runner/install
[docker-td]: https://hub.docker.com/r/jeremymarshall/docker-teradata-client
[miniconda-centos]: https://github.com/moble/miniconda-centos
[image config]: https://docs.GitLab.com/ce/ci/docker/using_docker_images.html
[GitLab-ci]: https://docs.GitLab.com/ce/ci/yaml/README.html
[Managing environments]: https://conda.io/docs/user-guide/tasks/manage-environments.html
[Configuring GitLab Runners]: https://docs.GitLab.com/ee/ci/runners
[Pipeline Schedules]: https://docs.GitLab.com/ce/user/project/pipelines/schedules.html
[logo]: https://gitlab.com/gitlab-org/gitlab-runner
