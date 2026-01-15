# 12-Factor App Workshop (Angular + Express)

This workshop demonstrates the **12-Factor App principles**
using a real **Angular + Express** application.

⏱ Duration: **10–15 minutes**  
🎯 Target: **Full-stack Developers & DevOps**

---

## Prerequisites

Before you begin, ensure you have the following software installed on your system:

```bash
Docker            : 28.3.2
Docker Desktop    : 4.55.0
Angular CLI       : 21.0.5
Node.js           : 22.18.0
Package Manager   : npm 10.9.3
Makefile          : Make 3.82.90
```

---

## Repository

FrontEND : https://github.com/phongphat-myorder/RVE-frontend-repo

BackEND : https://github.com/phongphat-myorder/RVE-backend-repo

---

## Factor 1. Codebase

_"One codebase tracked in revision control, many deploys"_

Use Git and Github to version control the codebase

`note:This project uses a Makefile to manage and execute scripts.`

```bash
git clone git@github.com:phongphat-myorder/12factor-angular-express-workshop.git
```

then clone frontend and backend by make command

```bash
cd 12factor-angular-express-workshop
make set
```

## Factor 2. Dependencies

This project uses a Node Package Manager ( `npm` ) to manage package and package-lock

```bash
make npm-install #auto command install frontend and backend
```

## Factor 3. Config  ( # add more config!!!!!)

_"Store config in the environment"_

When deploying to different environments, it is necessary to create configuration files that are appropriate for each environment. We recommend using [GitHub Secrets](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets), which provide a secure way to store sensitive information such as API keys, tokens, credentials, and passwords within your GitHub repositories, organizations, or environments.

at backend need `.env` file

.env.example

```bash
EMAIL_USER=YourEmail@gmail.com   #your Google email
EMAIL_PASS=YourEmailPassword     #use google app password for security
```

google app password: *https://myaccount.google.com/apppasswords*

## Factor 4. Backing service

_"Treat backing services as attached resources"_

A backing service is any service the app consumes over the network as part of its normal operation.

Redis

## Factor 5. Build, Release, Run