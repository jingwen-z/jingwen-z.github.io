#!/bin/bash
#
#    This script creates a new blog post with metadata in ./_posts
#    folder. Date will be generated according to the current time in
#    the system. Usage:
#
#        ./newpost.sh "My Blog Post Title"
#

title=$1

if [[ -z "$title" ]]; then
    echo "usage: newpost.sh \"My New Blog\""
    exit 1
fi

bloghome=$(cd "$(dirname "$0")" || exit; pwd)
url=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
filename="$(date +"%Y-%m-%d")-$url.md"
filepath="$bloghome/_posts/$filename"

if [[ -f "$filepath" ]]; then
    echo "$filepath already exists."
    exit 1
fi

cat << EOF >> "$filepath"
---
layout:      post
title:       "$title"
date:        "$(date +"%Y-%m-%d %H:%M:%S %z")"
tags:        [python3]
comments:    true
excerpt:     >
    This blog ...
img_url:     /images/
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="image"
  src="{{ site.baseurl }}/images/20210110-image.jpg"/>
</p>

... In this blog, I'll talk about this with the
following points:


If you are curious about the scripts, you will find them [here][notebook].



## References
- "", __. [Online]. Available: [][r]

[notebook]:
[image]:

EOF

echo "Blog created: $filepath"
