## Introduction

In this session we will be looking at a straight forward implementation of a Lambda Function.  This will be our first foray into Serverless computing with AWS, and as Serverless solutions become more and more popular, more systems are being built using Lambda Functions and leveraging the power that they bring.

We will only be working with one module in this session, and a handful of resources from the AWS provider focusing on the basics of deploying a Lambda Function.

## Lambda Module - data.tf

To build our Lambda we need to have a function written in one of the accepted languages as sourcecode. In this example we will be working with JavaScript, and the sourcecode is the *sample.js* file, as this is a basic implementation of a Lambda function I have kept things simple.

However we cannot use this *sample.js* file as it is to deploy our Lambda, we first need to package it into a zip file.  In the *data.tf* file we are using a *archive_file* data resource to take the *sample.js* and package it as *lambda_function.zip*.  We will then be referring this file in our *main.tf* as we build our Lambda Function.

## Lambda Module - main.tf

In the *main.tf* for this module the first resource that we are creating is Lambda Function itself, we need to pass in a few attributes to describe the Lambda that we want to create, which I will outline below.

- filename - We need to define the name of the file that holds the source code for our Lambda.  In this example we are using a zip file that is stored in the same repository as our Terraform code in the *data* directory.
- function_name - We need a way to refer to our Lambda once we have created it, ensure that this name is sensible and unique for the region in which you are working.
- role - We need to supply our Lambda with an IAM role for it to assume, we are defining this role later in the file in its own resource.
- handler - the name of the function/method within the code that we want to execute, how you will refer to this differs depending upon which language you are working with.
- source_code_hash - This handy attribute allows us to more easily trigger updates to our Lambda Function once it has been deployed. We need to supply the attribute with a base64 encoded hash of the file that we are deploying, we are leveraging the output from our *lambda_zip* data resource to do this.
- runtime - Choose from the limited number of runtime environments that AWS offers, in our example, as we are working with JavaScript, we are using the *nodejs12.x* environment.

And now for the *aws_iam_role* resource, this is where we are defining the execution role that our Lambda function requires. This role grants our Lambda function the permissions that it needs in order to access the various AWS services and resources required.  You can find the policy document, *policy.json*, that we are using in the *Lambda/data* directory.