---
layout:      post
title:       "How to apply mock with python unittest module?"
lang:        en
date:        "2020-07-16 22:11:20 +0200"
tags:        [python3, unittest, mock]
comments:    true
excerpt:     >
    This blog talks about how to apply mock with python unittest module, like
    use "unittest.mock" to simulate the behavior of complex or real objects,
    configure your mock instance with "return_value" or / and "side_effect",
    check how you called a method with assertions and mock an object with
    "patch()".
cover:       /images/20200716-python-mock.png
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Imagine that when we wrote a Python class to extract some business places'
reviews with Google Place API, how could we ensure that we will extract the data
correctly without sending requests to Google? In this case, we can use python
module `unittest` to mock a `requests.get` and to test if we will get the
expectant result. In this blog, I will introduce python mock object with the
following point:
- What is mock?
- Why we use mock?
- Python mock library
- The mock object
- Usecases

## What is mock?
In object-oriented programming, mock objects are simulated objects that mimic
the behavior of real objects in controlled ways, most often as part of a
software testing initiative. A programmer typically creates a mock object to
test the behavior of some other object, in much the same way that a car designer
uses a crash test dummy to simulate the dynamic behavior of a human in vehicle
impacts. 

## Why we use mock?
In a unit test, mock objects can simulate the behavior of complex, real objects
and are therefore useful when a real object is impractical or impossible to
incorporate into a unit test. If an object has any of the following
characteristics, it may be useful to use a mock object in its place:
- the object supplies non-deterministic results (e.g. the current time or the
current temperature)
- it has states that are difficult to create or reproduce (e.g. a network error)
- it is slow (e.g. a complete database, which would have to be initialized
before the test)
- it does not yet exist or may change behavior
- it would have to include information and methods exclusively for testing
purposes (and not for its actual task)

For example, an alarm clock program that causes a bell to ring at a certain
time might get the current time from a time service. To test this, the test must
wait until the alarm time to know whether it has rung the bell correctly. If a
mock time service is used in place of the real-time service, it can be
programmed to provide the bell-ringing time (or any other time) regardless of
the real-time, so that the alarm clock program can be tested in isolation. 

## Python mock library
From this section, I'll talk about mock with `unittest.mock` library.

`unittest.mock` is a library for testing in Python. It allows you to replace
parts of your system under test with mock objects and make assertions about how
they have been used.

`unittest.mock` provides a core `Mock` class removing the need to create a host
of stubs throughout your test suite. After acting, you can make assertions about
which methods/attributes were used and the arguments they were called with. You
can also specify return values and set needed attributes in the normal way.

Additionally, mock provides a `patch()` decorator that handles patching module
and class level attributes within the scope of a test.

Mock is based on the 'action -> assertion' pattern instead of 'record -> replay'
used by many mocking frameworks.

## The mock object
### The Mock Class
`unittest.mock` offers a base class for mocking objects called `Mock`. `Mock` is
a flexible mock object intended to replace the use of stubs and test doubles
throughout your code. Mocks are callable and create attributes as new mocks when
you access them. Accessing the same attribute will always return the same mock.
Mocks record how you use them, allowing you to make assertions about what your
code has done to them.

We can create a `mock` instance as follows:

```python
>>> from unittest.mock import Mock
>>> mock = Mock()
>>> mock
<Mock id='4448647264'>
```

Moreover, we can also specify parameters' values like `return_value`:
```python
>>> mock = Mock(return_value=3)
>>> mock.return_value
3
>>> mock()
3
```

### Configure the returned value with `return_value`
We can set `return_value` to configure the value returned by calling the mock:
```python
>>> mock = Mock()
>>> mock.return_value = 'fish'
>>> mock()
'fish'
```

`return_value` can also be set in the constructor:
```python
>>> mock = Mock(return_value=3)
>>> mock.return_value
3
>>> mock()
3
```

### Configure the raising exceptions with `side_effect`
This can either be a function to be called when the mock is called, an iterable
or an exception (class or instance) to be raised.

If you pass in a function it will be called with the same arguments as the mock
and unless the function returns the `DEFAULT` singleton the call to the mock will
then return whatever the function returns. If the function returns `DEFAULT`
then the mock will return its normal value (from the `return_value`).

If you pass in an iterable, it is used to retrieve an iterator which must yield
a value on every call. This value can either be an exception instance to be
raised or a value to be returned from the call to the mock (`DEFAULT` handling
is identical to the function case).

An example of a mock that raises an exception (to test exception handling of an
API):
```python
>>> mock = Mock()
>>> mock.side_effect = Exception('Boom!')
>>> mock()
Traceback (most recent call last):
  ...
Exception: Boom!
```

Using `side_effect` to return a sequence of values:
```python
>>> mock = Mock()
>>> mock.side_effect = [3, 2, 1]
>>> mock(), mock(), mock()
(3, 2, 1)
```

### Assertions
Mock instances store data on how you used them. For example, you can see if you
called a method, how you called it, etc.

#### `assert_called()`
Assert that the mock was called at least once.
```python
>>> mock = Mock()
>>> mock.method()
<Mock name='mock.method()' id='...'>
>>> mock.method.assert_called()
```

#### `assert_called_once()`
Assert that the mock was called exactly once.
```python
>>> mock = Mock()
>>> mock.method()
<Mock name='mock.method()' id='...'>
>>> mock.method.assert_called_once()
>>> mock.method()
<Mock name='mock.method()' id='...'>
>>> mock.method.assert_called_once()
Traceback (most recent call last):
...
AssertionError: Expected 'method' to have been called once. Called 2 times.
```

#### `assert_called_with(*args, **kwargs)`
This method is a convenient way of asserting that the last call has been made in
a particular way:
```python
>>> mock = Mock()
>>> mock.method(1, 2, 3, test='wow')
<Mock name='mock.method()' id='...'>
>>> mock.method.assert_called_with(1, 2, 3, test='wow')
```

#### `assert_called_once_with(*args, **kwargs)`
Assert that the mock was called exactly once and that that call was with the
specified arguments.
```python
>>> mock = Mock(return_value=None)
>>> mock('foo', bar='baz')
>>> mock.assert_called_once_with('foo', bar='baz')
>>> mock('other', bar='values')
>>> mock.assert_called_once_with('other', bar='values')
Traceback (most recent call last):
  ...
AssertionError: Expected 'mock' to be called once. Called 2 times.
```

### Calling
Mock objects are callable. The call will return the value set as the
`return_value` attribute. The default return value is a new Mock object; it is
created the first time the return value is accessed (either explicitly or by
calling the Mock) - but it is stored and the same one returned each time.

Calls made to the object will be recorded in the attributes like `call_args` and
`call_args_list`.

#### `call_args`
This is either `None` (if the mock hasn’t been called), or the arguments that
the mock was last called with.
```python
>>> mock = Mock(return_value=None)
>>> print(mock.call_args)
None
>>> mock()
>>> mock.call_args
call()
>>> mock.call_args == ()
True
```

This will be in the form of a tuple: the first member, which can also be
accessed through the args property, is any ordered arguments the mock was called
with (or an empty tuple) and the second member, which can also be accessed
through the kwargs property, is any keyword arguments (or an empty dictionary).

```python
>>> mock(3, 4)
>>> mock.call_args
call(3, 4)
>>> mock.call_args == ((3, 4),)
True
>>> mock.call_args.args
(3, 4)
>>> mock.call_args.kwargs
{}
>>> mock(3, 4, 5, key='fish', next='w00t!')
>>> mock.call_args
call(3, 4, 5, key='fish', next='w00t!')
>>> mock.call_args.args
(3, 4, 5)
>>> mock.call_args.kwargs
{'key': 'fish', 'next': 'w00t!'}
```

#### `call_args_list`
This is a list of all the calls made to the mock object in sequence (so the
length of the list is the number of times it has been called). Before any calls
have been made it is an empty list. The `call` object can be used for
conveniently constructing lists of calls to compare with `call_args_list`.

```python
>>> mock = Mock(return_value=None)
>>> mock()
>>> mock(3, 4)
>>> mock(key='fish', next='w00t!')
>>> mock.call_args_list
[call(), call(3, 4), call(key='fish', next='w00t!')]
>>> expected = [(), ((3, 4),), ({'key': 'fish', 'next': 'w00t!'},)]
>>> mock.call_args_list == expected
True
```

#### `method_calls`
As well as tracking calls to themselves, mocks also track calls to methods and
attributes, and _their_ methods and attributes:

```python
>>> mock = Mock()
>>> mock.method()
<Mock name='mock.method()' id='...'>
>>> mock.property.method.attribute()
<Mock name='mock.property.method.attribute()' id='...'>
>>> mock.method_calls
[call.method(), call.property.method.attribute()]
```

### patch()
```python
unittest.mock.patch(target, new=DEFAULT, spec=None, create=False, spec_set=None,
                    autospec=None, new_callable=None, **kwargs)
```

`patch()` acts as a function decorator, class decorator, or a context manager.
Inside the body of the function or with a statement, the _target_ is patched with
a _new_ object. When the function/with statement exits the patch is undone.

_target_ should be a string in the form `'package.module.ClassName'`. The
_target_ is imported and the specified object replaced with the new object, so
the _target_ must be importable from the environment you are calling `patch()`
from. The target is imported when the decorated function is executed, not at
decoration time.

#### 3 ways to apply the mock with `patch()`
- Decorator
If you want to mock an object for the duration of your entire test function,
you can use `patch()` as a function decorator.

```python
import unittest
from unittest.mock import patch

from requests.exceptions import Timeout

import learn_unittest_mock.learn_mock


class PatchDecoratorTest(unittest.TestCase):
    @patch('learn_unittest_mock.learn_mock.requests')
    def test_get_holiday(self, mock_requests):
        mock_requests.get.side_effect = Timeout
        with self.assertRaises(Timeout):
            learn_unittest_mock.learn_mock.get_holidays()

        mock_requests.get.assert_called_once()


if __name__ == '__main__':
    unittest.main()
```

- Context manager
You only want to mock an object for a part of the test scope. You are already
using too many decorators or parameters, which hurts your test’s readability.

```python
import unittest
from unittest.mock import patch

from requests.exceptions import Timeout

import learn_unittest_mock.learn_mock


class PatchContextManagerTest(unittest.TestCase):
    def test_context_manager(self):
        with patch('learn_unittest_mock.learn_mock.requests') as mock_requests:
            mock_requests.get.side_effect = Timeout
            with self.assertRaises(Timeout):
                learn_unittest_mock.learn_mock.get_holidays()

            mock_requests.get.asser_called_once()


if __name__ == '__main__':
    unittest.main()
```

- Inline
This approach is using start and stop on the mock itself to apply the mock
inline. If you need to do a lot of mocking in the test, you will have either
decorators or context managers or a mix of the two, which is ugly or heavy. In
this case you can apply the mock in "inline" approach.

All the patchers have `start()` and `stop()` methods. These make it simpler to
do patching in `setUp` methods or where you want to do multiple patches without
nesting decorators or with statements.

To use them call `patch()`, `patch.object()` or `patch.dict()` as normal and
keep a reference to the returned `patcher` object. You can then call `start()`
to put the patch in place and `stop()` to undo it. If you are using `patch()`
to create a mock for you then it will be returned by the call to `patcher.start`.

```python
import unittest
from unittest.mock import patch

from requests.exceptions import Timeout

import learn_unittest_mock.learn_mock


class PatchInlineTest(unittest.TestCase):
    def setUp(self):
        self.patcher = patch('learn_unittest_mock.learn_mock.requests')
        self.patcher.start()

    def test_get_holiday(self):
        learn_unittest_mock.learn_mock.requests.get.side_effect = Timeout
        with self.assertRaises(Timeout):
            learn_unittest_mock.learn_mock.get_holidays()

        learn_unittest_mock.learn_mock.requests.get.assert_called_once()

    def tearDown(self):
        self.patcher.stop()


if __name__ == '__main__':
    unittest.main()
```

## Usecases
### Mocking sending requests with Google Places API
```python
# learn_unittest_mock/google_place_api.py
from urllib.parse import urlencode

import requests


class Place:
    def __init__(self, lat, lng, place_name, place_id, glb_rating):
        self.lat = lat
        self.lng = lng
        self.place_name = place_name
        self.place_id = place_id
        self.glb_rating = glb_rating


def search_place(gps='gps', api_key='api_key') -> Place:
    response = requests.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?' + urlencode(
            {'location': gps, 'rankby': 'distance',
             'name': 'La Poste', 'key': api_key}
        ))

    if response.status_code == 200:
        resp_json = response.json()
        lat = resp_json['results'][0]['geometry']['location']['lat']
        lng = resp_json['results'][0]['geometry']['location']['lng']
        place_name = resp_json['results'][0]['name']
        place_id = resp_json['results'][0]['place_id']
        glb_rating = resp_json['results'][0]['rating']
        return Place(lat, lng, place_name, place_id, glb_rating)
    else:
        return Place(0, 0, 'null', 'null', 0)
```

In the scripts `google_place_api.py`, I create a Python class named "`Place`",
which contains one place's latitude, longitude, name, ID and its rating; then I
create a function `search_place(gps='gps', api_key='api_key')` in order to get
places' information by Google Places API and inject the values into `Place`
class.

```python
# learn_unittest_mock/google_place_api_test.py
import unittest
from unittest.mock import patch, Mock, call

from requests.exceptions import Timeout

import learn_unittest_mock.google_place_api as target


class GooglePlaceApiTest(unittest.TestCase):
    def setUp(self):
        self.patcher = patch('learn_unittest_mock.google_place_api.requests')
        self.patcher.start()

    def test_search_place_side_effect(self):
        target.requests.get.side_effect = Timeout

        # use .assertRaises() to verify that get_holidays() raises an exception
        # given the new side effect of get()
        with self.assertRaises(Timeout):
            target.search_place()

    def test_search_place_return_value(self):
        response_mock = Mock()
        response_mock.status_code = 200
        response_mock.json.return_value = {
            'results': [
                {
                    'geometry': {
                        'location': {
                            'lat': 48.830273,
                            'lng': 2.8059952
                        }
                    },
                    'name': 'La Poste',
                    'place_id': 'abcdefg',
                    'rating': 5
                }
            ]
        }

        target.requests.get.side_effect = [Timeout, response_mock]
        with self.assertRaises(Timeout):
            target.search_place()

        res = target.search_place()

        # test requests' results
        self.assertEqual(res.lat, 48.830273)
        self.assertEqual(res.lng, 2.8059952)
        self.assertEqual(res.place_name, 'La Poste')
        self.assertEqual(res.place_id, 'abcdefg')
        self.assertEqual(res.glb_rating, 5)

        # assert that the mock was called at least once
        target.requests.get.assert_called()

        # how many times the mock object has been called
        self.assertEqual(2, target.requests.get.call_count)

        # test arguments that the mock was last called with
        self.assertEqual(
            call(
                'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=gps&rankby=distance&name=La+Poste&key=api_key'),
            target.requests.get.call_args)

        # list of all the calls made to the mock object in the sequence
        self.assertEqual(
            [
                call(
                    'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=gps&rankby=distance&name=La+Poste&key=api_key'),
                call(
                    'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=gps&rankby=distance&name=La+Poste&key=api_key')],
            target.requests.get.call_args_list)

    def tearDown(self):
        self.patcher.stop()


if __name__ == '__main__':
    unittest.main()
```

In the `google_place_api_test.py` scripts, I firstly patch the
`learn_unittest_mock.google_place_api.requests`, then create multiple tests:
- `test_search_place_side_effect`: configure the `side_effect` to respond to a
connection timeout.
- `test_search_place_return_value`: I mock the requests' return value with
`status_code` and `return_value`, configure the `side_effect` with `[Timeout,
response_mock]`. Thus, the first time we call `target.search_place()`, it raises
`Timeout`, then we call it again and save the results as `res`. Next, we can
test if the results are the same as we set with `self.assertEqual`; test if the
mock object was called at least once with `assert_called()`; test if the mock
has been called twice; test arguments that the mock was last called with and the
list of all the calls mode to the mock in sequence.

### Mocking generating dates
```python
# learn_unittest_mock/dates_generator.py

import calendar
from datetime import datetime, date

from dateutil.relativedelta import relativedelta


class StartEndDates:
    def __init__(self, last_week_start, last_week_end, last_month_start,
                 last_month_end):
        self.last_week_start = last_week_start
        self.last_week_end = last_week_end
        self.last_month_start = last_month_start
        self.last_month_end = last_month_end


def start_end_dates() -> StartEndDates:
    now = datetime.now()
    now_wkday = now.weekday()
    last_week_start = (now + relativedelta(days=-now_wkday - 7)).date()
    last_week_end = (now + relativedelta(days=-now_wkday - 1)).date()

    m_1 = (now + relativedelta(months=-1)).date()
    last_month_start = date(m_1.year, m_1.month, 1)
    last_month_end = date(m_1.year, m_1.month,
                          calendar.monthrange(m_1.year, m_1.month)[1])

    return StartEndDates(last_week_start, last_week_end,
                         last_month_start, last_month_end)
```

In the scripts `dates_generator.py`, I created a class named `StartEndDates`
which contains the start date and end date for last week and last month,
respectively. I also created a function `start_end_dates()` who injects the 4
dates into the `StartEndDates` class.

```python
# learn_unittest_mock/dates_generator_test.py
import unittest
from datetime import datetime, date
from unittest.mock import patch

import learn_unittest_mock.dates_generator as target

d_20191231 = datetime(2019, 12, 31)
d_20200101 = datetime(2020, 1, 1)
d_20200302 = datetime(2020, 3, 2)


class DatesGeneratorTest(unittest.TestCase):
    def setUp(self):
        # mock datetime to control today's date
        self.patcher = patch('learn_unittest_mock.dates_generator.datetime')
        self.patcher.start()

    def test_20191231(self):
        target.datetime.now.return_value = d_20191231
        self.assertEqual(d_20191231, target.datetime.now())

        res = target.start_end_dates()
        self.assertEqual(date(2019, 12, 23), res.last_week_start)
        self.assertEqual(date(2019, 12, 29), res.last_week_end)
        self.assertEqual(date(2019, 11, 1), res.last_month_start)
        self.assertEqual(date(2019, 11, 30), res.last_month_end)

    def test_20200101(self):
        target.datetime.now.return_value = d_20200101
        self.assertEqual(d_20200101, target.datetime.now())

        res = target.start_end_dates()
        self.assertEqual(date(2019, 12, 23), res.last_week_start)
        self.assertEqual(date(2019, 12, 29), res.last_week_end)
        self.assertEqual(date(2019, 12, 1), res.last_month_start)
        self.assertEqual(date(2019, 12, 31), res.last_month_end)

    def test_20200302(self):
        target.datetime.now.return_value = d_20200302
        self.assertEqual(d_20200302, target.datetime.now())

        res = target.start_end_dates()
        self.assertEqual(date(2020, 2, 24), res.last_week_start)
        self.assertEqual(date(2020, 3, 1), res.last_week_end)
        self.assertEqual(date(2020, 2, 1), res.last_month_start)
        self.assertEqual(date(2020, 2, 29), res.last_month_end)

    def tearDown(self):
        self.patcher.stop()


if __name__ == '__main__':
    unittest.main()
```

In the `dates_generator_test.py`, I firstly mock `datetime` then configure the
value of "`datetime.now`" with `return_value` and test if the dates are the same
as expectant。

## Conclusion
According to this blog, now you can:
- understand what is mock and why we use mock
- use `unittest.mock` to simulate the behavior of complex or real objects
- configure your mock instance with `return_value` or / and `side_effect`
- check how you called a method with assertions
- mock an object with `patch()`


## Reference
- Alex Ronquillo, "Understanding the Python Mock Object Library", _realpython.com_. [Online]. Available: [https://realpython.com/python-mock-library/][r1]
- "unittest.mock — mock object library", _docs.python.org_. [Online]. Available: [https://docs.python.org/3/library/unittest.mock.html#][r2]
- redshiftzero, "How to use Python's unittest.mock.patch", _www.youtube.com_. [Online]. Available: [https://www.youtube.com/watch?v=WFRljVPHrkE&t=345s][r3]
- "Mock object", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/Mock_object][r4]
- "An introduction to mocking in python", _bs-uploads.toptal.io_. [Online]. Available: [https://bs-uploads.toptal.io/blackfish-uploads/blog/article/content/cover_image_file/cover_image/17606/cover-0402-an-introduction-to-mocking-in-python-Waldek_Newsletter-fdc7cce1eda95aee17e25b769a2bd183.png][r5]

[r1]: https://realpython.com/python-mock-library/
[r2]: https://docs.python.org/3/library/unittest.mock.html#
[r3]: https://www.youtube.com/watch?v=WFRljVPHrkE&t=345s
[r4]: https://en.wikipedia.org/wiki/Mock_object
[r5]: https://bs-uploads.toptal.io/blackfish-uploads/blog/article/content/cover_image_file/cover_image/17606/cover-0402-an-introduction-to-mocking-in-python-Waldek_Newsletter-fdc7cce1eda95aee17e25b769a2bd183.png
