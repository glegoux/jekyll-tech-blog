---
title: "Development Environment"
description: "Why isolate its development environment?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Development"
tags: [" Working environment"]
---

It is a good practice to isolate the used technologies for your development environment, because: 

1. Your operating system could already have an installed version of this technology for its own needs, 
and you don't want touch that for not break that. 
2. Your development environment should be close to your production environment, that is not necessary the same as your local environment  
3. Your projects use certainly several versions of the same technology, you don't want to have conflicts between them 

That's why you need to have a tool in order to build and isolate your environment development, and to can switch between 
these different environment.

Of course, it depends on which kind of projects you work. You don't need to have always a full isolated environment by setting up 
another physical machine (bare metal), a virtual machine or a container. Because, the computer ecosystem is composed of layers. 

If you use only a high-level layer for writing applications in `Python`, `Java` or `Ruby` ..., you can use a tool of version management 
as `Pyenv`,  `Sdkman` and `Rvm`, it is sufficient. Like that you can use your project language in the correct version for your project, 
directly on your host machine that you be on Windows, WSL, macOS, or a Linux distribution and regardless of the environment ecosystem ... 
because these languages are cross platform. You need also that related dependencies libraries be installed in dedicated locations, 
but these tools do that as well. 

If you need to have other services like a database, a email service, a message brokers, machine learning platform, perhaps you can
use a pre-built staging environment for each service, running on your own machine, or on a cluster with the cloud computing paradigme if
the services are too complex to set up or too greedy in resources. Else often, you can use mock-ups for each service respecting
the contract of interface.

This problematic is the same for the test environment, or the pre-production environment and prod environment. In addition, for security 
reason, these environments should be isolated and partitioned with a segregation of permission. It is another subject.
