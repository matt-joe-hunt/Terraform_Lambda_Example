## Introduction

# Justification

I'm a firm believer that when learning a new technology that keeping things simple in the first instance is of paramount importance.  Frankly all the frilly bits can come later!

What I offer here is a basic example of deploying an AWS infrastructure using Terraform.  You can use this simple structure to deploy a Lambda function behind an API Gateway (API GW), the Lambda uses the simple code described in the *sample.js* file.

Do not expect this to be complete with all industry best practices, however if you are new to working with Terraform then this could be a good sample project to start with! My hope is that you will find some use in 'poking' this implementation to see how it works and changing it to see how it breaks. Below I will explain what some important sections of the code are doing so that you can start to build your own deployments.

## What is going on?

To create the structure of this project I have chosen to split the resources that I am creating into modules, these modules means that my deployment is easier to write, debug and maintain.

You will notice a consistent style within the project, the terraform code that is written for each module is grouped into 3 files, and these 3 .tf files also appear in the root of the project.

### main.tf

In this file the terraform resources are described, unless you are looking in the root of the project structure in which case the main.tf file describes the modules used in the project.

### variables.tf

In this file the variables that are used by the project and the various modules are defined, you will find that most of the variables are defined in the variables.tf file in the root of the project, making working with the project a little easier.

### outputs.tf

Often the least used of the 3 files, here the output from the resources created are defined.  This can be useful if you want to print some output to the console when the deployment is comepleted, as we are in this example.  This file can also be used to pass the output from one module to be used with another, you can also see an example of this here.

## Project Root

## API_Gateway

## Lambda

```
{"key":"value"}
```