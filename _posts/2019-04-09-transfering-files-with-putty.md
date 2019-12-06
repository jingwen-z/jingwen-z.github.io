---
layout:             post
title:              "Transfering files with Putty"
date:               "2019-04-09 19:18:27 +0200"
last_modified_at:   2019-12-06 16:58:14 +0100
comments:           true
excerpt:            >
    This blog introduces how to use `Putty` to transfer files from Windows OS
    to Linux OS and reverse.
img_url:            /images/20190409-transfer.jpg
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Transfering"
  src="{{ site.baseurl }}/images/20190409-transfer.jpg"/>
</p>

During my daily working, I do the development on Windows OS; besides, we have a
Debian server for running different jobs automatically, file storage, etc.
Sometimes, we also need to transfer files from Windows OS to Linux OS, or
reverse; in this case, we use Putty to realize the transfering. Today, I will
talk about how to use Putty for transfer files with the following points:
- What is Putty ?
- Requirements
- Transfering files from Windows to Linux
- Transfering files from Linux to Windows 

## What is Putty ?
[PuTTY][r1] is a free and open-source terminal emulator, serial console and
network file transfer application. It supports several network protocols,
including SCP, SSH, Telnet, rlogin, and raw socket connection. It can also
connect to a serial port. The name "PuTTY" has no official meaning.

## Requirements
- Windows OS
- Linux OS
- Putty installed: download Putty [here][putty-download]
- Putty PSCP installed: download Putty PSCP [here][putty-download]

## Transfering files from Windows to Linux
To transfer files from Windows OS to Linux OS, we will apply `PSCP`. Before we
start, let's have a general understanding of it. `PSCP` means "PuTTy Secure
Copy Protocol (PSCP)", is a tool for transferring files securely between
computers using an SSH connection. To use this utility, we should be
comfortable working in the Windows Command Prompt.

Now, let's start to transfer files to Linux:
- Open Windows Command Prompt.
- Type `pscp source_path user_name@host:target_path` at the prompt
{% highlight bash %}
pscp weekly_report.xlsx xxx@123.456.789.0:reporting
{% endhighlight %}

<p align="center">
  <img alt="Wins to Linux 1"
  src="{{ site.baseurl }}/images/20190409-wins-to-linux-1.PNG"/>
</p>

Here, `./weekly_report.xlsx` specifies the path of source file, `xxx` is user's
account for accessing the Linux server, `123.456.789.0` is the host address,
`/reporting` presents target path.
- After the bash script above, we also need to type the password for accessing
the Linux server.

<p align="center">
  <img alt="Wins to Linux 2"
  src="{{ site.baseurl }}/images/20190409-wins-to-linux-2.PNG"/>
</p>

## Transfering files from Linux to Windows 
Transfering files from Linux OS to Windows OS is similar to the steps above:
- Open Windows Command Prompt.
- Type `pscp user_name@host:source_path target_path` at the prompt
{% highlight bash %}
pscp xxx@123.456.789.0:reporting/weekly_report.xlsx ./
{% endhighlight %}

<p align="center">
  <img alt="Linux to Wins 1"
  src="{{ site.baseurl }}/images/20190409-linux-to-wins-1.PNG"/>
</p>

- Same as above, after the bash script above, we also need to type the password
for accessing the Linux server.

<p align="center">
  <img alt="Linux to Wins 2"
  src="{{ site.baseurl }}/images/20190409-linux-to-wins-2.PNG"/>
</p>

## Conclusion
In this blog, I introduced how to use `Putty` to transfer files from Windows OS
to Linux OS and reverse. Hope it's useful for you.

## Reference
- "PuTTY", _wikipedia_. [Online]. Available: [https://en.wikipedia.org/wiki/PuTTY][r1]
- "Transfer Files Using PuTTY", _it.cornell.edu_. [Online]. Available: [https://it.cornell.edu/managed-servers/transfer-files-using-putty][r2]
- Comfreak, "traffic information superhighway", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/traffic-information-superhighway-3524185/][r3]

[r1]: https://en.wikipedia.org/wiki/PuTTY
[putty-download]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
[r2]: https://it.cornell.edu/managed-servers/transfer-files-using-putty
[r3]: https://pixabay.com/photos/traffic-information-superhighway-3524185