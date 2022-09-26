---
layout:      post
title:       "Building Azure function with Python"
lang:        en
date:        "2022-09-25 09:47:03 +0200"
tags:        [python3, Microsoft Azure]
comments:    true
excerpt:     >
    In this article, we talk about what we need to create an Azure function,
    what is HTTP triggers and bindings, how to test its functionality locally
    and how to publish it on Azure.
cover:       /images/20220925-azure-python.png
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
Recently I accomplished a product feature which checks input data quality after
users upload their datasets to our platform. To return the checking result to
the backend, I created an HTTP API to simplify the communication and since we
use Microsoft Azure, we choose to create it with the Azure function. In this
blog, I'll talk about this with the following points:
- What is Azure function?
- Prerequisites
- Folder structure
- HTTP trigger and bindings
- Run functions locally
- Publish on Azure
- Going further
- Conclusion

## What is Azure function?
Azure Function is a serverless solution that allows you to write less code,
maintain less infrastructure, and save on costs. Instead of worrying about
deploying and maintaining servers, the cloud infrastructure provides all the
up-to-date resources needed to keep your applications running.

You focus on the pieces of code that matter most to you, and Azure Functions
handles the rest.

You can build an Azure function to react to a series of critical events, for
example building a web API, responding to database changes, processing IoT data
streams, or even managing message queues, etc. and with your preferred language
(C#, Java, JavaScript, PowerShell, Python, etc.). In the blog, I'll only talk
about **building a web API with Python**.

## Prerequisites
The specific prerequisites for Core Tools depend on the features you plan to use:

- [Publish](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Cwindows%2Cpython%2Cportal%2Cbash#publish):
Core Tools currently depends on either the Azure CLI or Azure PowerShell for
authenticating with your Azure account. This means that you must install one of
these tools to be able to publish to Azure from Azure Functions Core Tools.
- [Install extensions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Cwindows%2Cpython%2Cportal%2Cbash#install-extensions):
To manually install extensions by using Core Tools, you must have the .NET Core
3.1 SDK installed. The .NET Core SDK is used by Core Tools to install extensions
from NuGet. You don't need to know .NET to use Azure Functions extensions.
- Install the [Azure Functions Core Tools](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Cwindows%2Cpython%2Cportal%2Cbash#install-the-azure-functions-core-tools):
Azure Functions Core Tools lets you develop and test your functions on your
local computer from the command prompt or terminal. Your local functions can
connect to live Azure services, and you can debug your functions on your local
computer using the full Functions runtime. You can even deploy a function app
to your Azure subscription.

## Folder structure
The recommended folder structure for an Azure Functions project in Python looks
like the following example:
```
<project_root>/
 | - .venv/
 | - .vscode/
 | - my_first_function/
 | | - __init__.py
 | | - function.json
 | | - example.py
 | - my_second_function/
 | | - __init__.py
 | | - function.json
 | - shared_code/
 | | - __init__.py
 | | - my_first_helper_function.py
 | | - my_second_helper_function.py
 | - tests/
 | | - test_my_second_function.py
 | - .funcignore
 | - host.json
 | - local.settings.json
 | - requirements.txt
 | - Dockerfile
```
The main project folder can contain the following files:
- `requirements.txt`: Contains the list of Python packages that the system
installs when you're publishing to Azure.
- `host.json`: Contains configuration options that affect all functions in a
function app instance. This file is published to Azure. Not all options are
supported when functions are running locally.
- `.vscode/`: (Optional) Contains stored Visual Studio Code configurations.
- `.venv/`: (Optional) Contains a Python virtual environment that's used for
local development.
- `Dockerfile`: (Optional) Used when you're publishing your project in a custom
container.
- `tests/`: (Optional) Contains the test cases of your function app.
- `.funcignore`: (Optional) Declares files that shouldn't be published to Azure.
Usually, this file contains `.vscode/` to ignore your editor setting, `.venv/`
to ignore the local Python virtual environment, `tests/` to ignore test cases,
and `local.settings.json` to prevent local app settings from being published.

### local.settings.json
Used to store app settings and connection strings when functions are running
locally. This file isn't published to Azure.

```
{
  "IsEncrypted": false,
  "Values": {
    "FUNCTIONS_WORKER_RUNTIME": "<language worker>",
    "AzureWebJobsStorage": "<connection-string>",
    "MyBindingConnection": "<binding-connection-string>",
    "AzureWebJobs.HttpExample.Disabled": "true"
  },
  "Host": {
    "LocalHttpPort": 7071,
    "CORS": "*",
    "CORSCredentials": false
  },
  "ConnectionStrings": {
    "SQLConnectionString": "<sqlclient-connection-string>"
  }
}
```
- IsEncrypted: When this setting is set to `true`, all values are encrypted with
a local machine key. Used with `func settings` commands. The default value is
`false`.
- Values: Collection of application settings used when a project is running
locally. This key-value (string-string) pairs correspond to application
settings in your function app in Azure, like [AzureWebJobsStorage](https://docs.microsoft.com/en-us/azure/azure-functions/functions-app-settings#azurewebjobsstorage).
  - `FUNCTIONS_WORKER_RUNTIME`: Indicates the targeted language of the Functions
  runtime.
  - `AzureWebJobsStorage`: Contains the connection string for an Azure storage
  account. Required when using triggers other than HTTP.
- Host: Settings in this section customize the Functions host process when you
run projects locally. These settings are separate from the `host.json` settings,
which also apply when you run projects in Azure.
You can find more information [here](https://learn.microsoft.com/en-us/azure/azure-functions/functions-develop-local#local-settings-file).

### Function code
A function is the primary concept in Azure Functions. A function contains two
important pieces - your code, which can be written in a variety of languages,
and some config, the function.json file. For compiled languages, this config
file is generated automatically from annotations in your code. For scripting
languages, you must provide the config file yourself.

The `function.json` file defines the function's trigger, bindings, and other
configuration settings. Every function has one and only one trigger. The runtime
uses this config file to determine the events to monitor and how to pass data
into and return data from function execution. The following is an example
`function.json` file.

```
{
    "scriptFile": "__init__.py",
    "bindings": [
        {
            "authLevel": "function",
            "type": "httpTrigger",
            "direction": "in",
            "name": "req",
            "methods": [
                "get",
                "post"
            ]
        },
        {
            "type": "http",
            "direction": "out",
            "name": "$return"
        }
    ]
}
```
The `bindings` property is where you configure both triggers and bindings. Each
binding shares a few common settings and some settings which are specific to a
particular type of binding. Every binding requires the following settings:
- `type`: Name of binding.
- `direction`: Indicates whether the binding is for receiving data into the
function or sending data from the function.
- `name`: The name that is used for the bound data in the function.

## HTTP trigger and bindings
### Concept
**Triggers** cause a function to run. A trigger defines how a function is
invoked and a function must have exactly one trigger. Triggers have associated
data, which is often provided as the payload of the function.

**Binding** to a function is a way of declaratively connecting another resource
to the function; bindings may be connected as input bindings, output bindings,
or both. Data from bindings are provided to the function as parameters.

You can mix and match different bindings to suit your needs. Bindings are
optional and a function might have one or multiple input and/or output bindings.

Triggers and bindings let you avoid hardcoding access to other services. **Your
function receives data** (for example, the content of a queue message) **in
function parameters. You send data** (for example, to create a queue message)
**by using the return value of the function.**

### Defining
The HTTP trigger is defined in the *function.json* file. The `name` parameter of
the binding must match the named parameter in the function. The previous
examples use the binding name `req`. This parameter is an [HttpRequest](https://docs.microsoft.com/en-us/python/api/azure-functions/azure.functions.httprequest)
object, and an [HttpResponse](https://docs.microsoft.com/en-us/python/api/azure-functions/azure.functions.httpresponse) object is returned.

From the `HttpRequest` object, you can get request headers, query parameters,
route parameters, and the message body.

Here is an example:

```python
def main(req: func.HttpRequest) -> func.HttpResponse:
    headers = {"my-http-header": "some-value"}

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        return func.HttpResponse(f"Hello {name}!", headers=headers)
    else:
        return func.HttpResponse(
             "Please pass a name on the query string or in the request body",
             headers=headers, status_code=400
        )
```
In this function, the value of the `name` query parameter is obtained from the
`params` parameter of the `HttpRequest` object. The JSON-encoded message body is
read using the `get_json` method. Likewise, you can set the `status_code` and
`headers` information for the response message in the returned `HttpResponse`
object.

<!-- ## Unit test
https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#unit-testing -->

## Run functions locally
**Before running functions locally, we need to have installed Azure Functions
Core Tools in your machine.**

To run a Functions project, you run the Functions host from the root directory
of your project. The host enables triggers for all functions in the project.

To test your functions locally, you start the Functions host and call endpoints
on the local server using HTTP requests.

The command below must be run in a virtual environment.
```
# start the Functions host
# version 2.x
func start
```

Then we call the following endpoint to locally run HTTP and webhook triggered
functions:
```
http://localhost:{port}/api/{function_name}
```

The following example is the function `MyHttpTrigger` called from a POST request
passing name in the request body:
```
curl --request POST http://localhost:7071/api/MyHttpTrigger --data '{"name":"Azure Rocks"}'
```

## Publish on Azure
When you're ready to publish, make sure that all your publicly available
dependencies are listed in the requirements.txt file. This file is at the root
of your project directory. You can also find project files and folders that are
excluded from publishing, including the virtual environment folder, in the root
directory of your project.

Three build actions are supported for publishing your Python project to Azure:
[remote build](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#remote-build),
[local build](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#local-build),
and builds that use [custom dependencies](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#custom-dependencies).

You can also use Azure Pipelines or GitHub Actions to build your dependencies
and publish by using continuous delivery (CD), which is also the way that I
choose.

In GitHub Actions, a workflow is an automated process that you define in your
GitHub repository. This process tells GitHub how to build and deploy your
function app project on GitHub. A workflow is defined by a YAML (.yml) file in
the `/.github/workflows/` path in your repository. This definition contains the
various steps as the following and parameters that make up the workflow:
- Generate deployment credentials
- Create the environment
- Build the function app
- Deploy the function app

For the details of each step, you can find information [here][r5].

## Going further
How to go further from here?
- If you want to know the best practices for reliable Azure Functions, visit
[https://learn.microsoft.com/en-us/azure/azure-functions/functions-best-practice](https://learn.microsoft.com/en-us/azure/azure-functions/functions-best-practices)
- If you want to plan for secure development, visit [https://learn.microsoft.com/en-us/azure/azure-functions/security-concepts](https://learn.microsoft.com/en-us/azure/azure-functions/security-concepts)
- If you want to monitor executions in Azure Functions, you can find more
information on [https://learn.microsoft.com/en-us/azure/azure-functions/functions-monitoring](https://learn.microsoft.com/en-us/azure/azure-functions/functions-monitoring)

## Conclusion
In this article, we talk about what we need to create an Azure function, what is
HTTP triggers and bindings, how to test its functionality locally and how to
publish it on Azure. Hope it's useful for you :)

## References
- Azure, "azure-functions-templates/Functions.Templates/Templates/HttpTrigger-Python", _github.com_. [Online]. Available: [https://github.com/Azure/azure-functions-templates/tree/dev/Functions.Templates/Templates/HttpTrigger-Python][azure-functions-HttpTrigger-Python]
- "Introduction to Azure Functions", _learn.microsoft.com_. [Online]. Available: [https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview][r1]
- "HTTP trigger and bindings", _learn.microsoft.com_. [Online]. Available: [https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#http-trigger-and-bindings][r2]
- t-eckert, "sample-python-azure-functions/encryption_and_decryption/", _github.com_. [Online]. Available: [https://github.com/t-eckert/sample-python-azure-functions/tree/master/encryption_and_decryption][r3]
- "Publishing to Azure", _learn.microsoft.com_. [Online]. Available: [https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#publishing-to-azure][r4]
- "Continuous delivery by using GitHub Actions", _learn.microsoft.com_. [Online]. Available: [https://learn.microsoft.com/en-us/azure/azure-functions/functions-how-to-github-actions?tabs=python][r5]
- coppla-note, "Azure Functions を使って Python スクリプトを API 化する", _coppla-note.net_. [Online]. Available: [https://www.coppla-note.net/posts/tutorial/azure-functions/][image]

[azure-functions-HttpTrigger-Python]: https://github.com/Azure/azure-functions-templates/tree/dev/Functions.Templates/Templates/HttpTrigger-Python
[r1]: https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview
[r2]: https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#http-trigger-and-bindings
[r3]: https://github.com/t-eckert/sample-python-azure-functions/tree/master/encryption_and_decryption
[r4]: https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level#publishing-to-azure
[r5]: https://learn.microsoft.com/en-us/azure/azure-functions/functions-how-to-github-actions?tabs=python
[image]: https://www.coppla-note.net/posts/tutorial/azure-functions/
