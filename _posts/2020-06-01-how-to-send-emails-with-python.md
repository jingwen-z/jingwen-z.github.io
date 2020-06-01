---
layout:      post
title:       "How to send E-mails with Python?"
date:        "2020-06-01 15:39:06 +0200"
tags:        [python3, smtp, unittest, mock]
comments:    true
excerpt:     >
    This blog introduces how to set up a fake SMTP server and send e-mails with
    python, and how to test sending e-mails with unittest.mock.
img_url:     /images/20200601-mail.png
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="20200601-mail"
  src="{{ site.baseurl }}/images/20200601-mail.png"/>
</p>

Imagine that we need to deliver some specific dashboards or report frequently,
it's more convenient to send them automatically rather than manually. In this
blog I'll talk about how to send an e-mail with Python in the following points:
- Setting up a fake SMTP server with Python
- Sending e-mails with Python
- Test sending e-mails with unittest.mock

## Setting up a fake SMTP server with Python
{% highlight bash %}
sudo python -m smtpd -n -c DebuggingServer localhost:25
{% endhighlight %}

- `-m mod` : run library module as a script (terminates option list)
- `-c cmd` : program passed in as string (terminates option list)

This command helps us to create a new debugging server, the messages will be
discarded, and printed on stdout.

We use `sudo` in this case because we're using port 25, if you don't want that
you can use a port higher than 1024.

## Sending e-mails with Python

{% highlight python %}
# sending_mail_by_python/sending_mail.py
from mailer import Message
import smtplib

def build_email(from_address, to_address, subject, content, attach_rpt):
    message = Message()
    message.From = from_address
    message.To = to_address
    message.Subject = subject
    message.Body = content
    message.attach(attach_rpt, mimetype='text/csv', charset='us-ascii')

    return message

def send_email(msg, host='', port=0):
    s = smtplib.SMTP(host, port, local_hostname="smtp.mydomain.com")
    result = s.sendmail(msg.From, msg.To, msg.as_string())
    s.quit()

    return result
{% endhighlight %}

For building mail, I created the `build_email()` function with `mailer` module
to specify the sender, the destination, the subject, mail's content, and
attachment if you want. For sending mail by SMTP, I created the `send_email()`
function with `smtplib` module. I firstly created an `SMTP` instance that
encapsulates an `SMTP` connection with `smtplib.SMTP`, assigning `host`, `port`
and `local_hostname`; then sending mail with this instance; exit when it
finished.

If you want to send an E-mail from "from@domain.com" to "to@domain.com", with
"subject" as the subject, "message" as the content and "test_df.csv" as the
attachment, using the `SMTP` instance "localhost:25", you can do like:

{% highlight python %}
msg = build_email('from@domain.com', ['to@domain.com'],
                  'subject', 'message', 'test_df.csv')
send_email(msg, 'localhost', 25)
{% endhighlight %}

Then you will get the following result in you terminal:

<p align="center">
  <img alt="20200601-example"
  src="{{ site.baseurl }}/images/20200601-example.png"/>
</p>

## Test sending e-mails with unittest.mock
Mocking the `SMTP` instance means we replace the original `SMTP` instance with
a mock, then we will test the functions above with it.

{% highlight python %}
import unittest
from unittest.mock import patch, call
from sending_mail_by_python import sending_mail as target

class SendEmailTests(unittest.TestCase):
    def test_send_email(self):
        with patch("smtplib.SMTP") as smtp:
            from_address = "from@domain.com"
            to_address = ["to@domain.com"]

            msg = target.build_email(
                from_address, to_address, "subject", "message")
            target.send_email(msg)

            # Get instance of mocked SMTP object
            instance = smtp.return_value
{% endhighlight %}

At the beginning of the test, I applied `unittest.mock.patch()` as a context
manager to mock the `smtplib.SMTP` class; then the elements for sending E-mail
are specified. Since I've mocked the `SMTP`, there is no more need to detail
the host and port. Before testing, I retrieved the instance of mocked SMTP
object, which will be used in the following tests.

{% highlight python %}
            # Checks the mock has been called at least one time
            self.assertTrue(instance.sendmail.called)

            # Check the mock has been called only once
            self.assertEqual(instance.sendmail.call_count, 1)
{% endhighlight %}

Now, let's test! I first tested if the mocked SMTP instance is called and only
called once.

{% highlight python %}
            # Check built e-mail elements
            self.assertEqual(msg.From, from_address)
            self.assertEqual(msg.To, to_address)

            # Check sent e-mail elements
            self.assertEqual(instance.sendmail.mock_calls[0][1][0],
                             from_address)
            self.assertEqual(instance.sendmail.mock_calls[0][1][1], to_address)
{% endhighlight %}

Then check the E-mail's elements are correspond with the assignment. If you want
to test the functions with attachment, you can check like
`self.assertEqual(msg.attachments[0][0], 'test_df.csv')`.

{% highlight python %}
            # Check the mock has been called ONLY once the given arguments and
            # keywords
            instance.sendmail.assert_called_once_with(msg.From,
                                                      msg.To,
                                                      msg.as_string())
{% endhighlight %}

Moreover, we can also check if `sendmail()` has been called only once with the
given arguments by `assert_called_once_with()`.

{% highlight python %}
            # Check the mock' calls are equal to a specific list of calls in a
            # specific order
            self.assertEqual(instance.sendmail.mock_calls,
                             [call(msg.From, msg.To, msg.as_string())]
{% endhighlight %}

We can check the mock' calls are equal to a specific list of calls in a specific
order as well.

## Reference
- Daniele Esposti, "Mocking objects in unit tests", _expobrain.net_. [Online]. Available: [https://expobrain.net/2013/08/27/mocking-objects-in-unit-tests/][r1]
- Stuart Colville, "Fake SMTP server with Python", _muffinresearch.co.uk_. [Online]. Available: [https://muffinresearch.co.uk/fake-smtp-server-with-python/][r2]
- "How to setup a fake SMTP server to catch all mails?", _serverfault.com_. [Online]. Available: [https://serverfault.com/questions/207619/how-to-setup-a-fake-smtp-server-to-catch-all-mails][r3]
- "smtpd — SMTP Server", _docs.python.org_. [Online]. Available: [https://docs.python.org/3/library/smtpd.html#debuggingserver-objects][r4]
- "send email via hotmail in python", _stackoverflow.com_. [Online]. Available: [https://stackoverflow.com/questions/13411486/send-email-via-hotmail-in-python][r5]
- "unittest.mock — mock object library", _docs.python.org_. [Online]. Available: [https://docs.python.org/3/library/unittest.mock.html][r6]
- "10.1.2 What information is listed", _www.gnu.org_. [Online]. Available: [http://www.gnu.org/software/coreutils/manual/html_node/What-information-is-listed.html#What-information-is-listed][r7]
- ribkhan, "Email newsletter marketing online", _pixabay.com_. [Online]. Available: [https://pixabay.com/illustrations/email-newsletter-marketing-online-3249062/][img]

[r1]: https://expobrain.net/2013/08/27/mocking-objects-in-unit-tests/
[r2]: https://muffinresearch.co.uk/fake-smtp-server-with-python/
[r3]: https://serverfault.com/questions/207619/how-to-setup-a-fake-smtp-server-to-catch-all-mails
[r4]: https://docs.python.org/3/library/smtpd.html#debuggingserver-objects
[r5]: https://stackoverflow.com/questions/13411486/send-email-via-hotmail-in-python
[r6]: https://docs.python.org/3/library/unittest.mock.html
[r7]: http://www.gnu.org/software/coreutils/manual/html_node/What-information-is-listed.html#What-information-is-listed
[img]: https://pixabay.com/illustrations/email-newsletter-marketing-online-3249062/