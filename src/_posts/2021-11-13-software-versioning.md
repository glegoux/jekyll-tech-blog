---
title: "Software versioning"
description: "How is assigned a version to a software?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Development"
---

# What is a software version? 

A software can be viewed as a set of line of codes that is dynamic, that is to say that evolves discretely from a 
state to a new state in function of time. To identify a specific state of this software a versioning system is often 
used whether it be for a language compiler, a library, a web API, an application, a server, or a client. Of course a 
version system can be used more generally for any project, but here I focus only on a software.

<figure class="notranslate">
<pre>
             ┌─────────┐           ┌─────────┐           ┌─────────┐
             │         │           │         │           │         │
  ──────────►│ State 1 ├──────────►│ State 2 ├──────────►│ State 3 │─────────►
             │         │           │         │           │         │
             └─────────┘           └─────────┘           └─────────┘
</pre>
<figcaption>Software states</figcaption>
</figure> 

The software versioning is the process to assign a version to a software: a version system is chosen with a version
scheme and a version strategy to track the evolutions. For example, with a version control system as [Git](https://git-scm.com/), 
the history of a software is split into commits, where each commit identifier is used as a version. 

<figure  class="notranslate">
<pre>
40551405dc02afe8240024c952fa1de953fc2ff9 Commit message: State 3
3982dcd90b486eab39eb610ec5e7e5963b92ab33 Commit message: State 2
32f0469eb344029bd1ecf5b0626685f2fa795f47 Commit message: State 1
...
</pre>
<figcaption>Commit logs with commit identifier and message</figcaption>
</figure> 

Here the version scheme is a [SHA1-hash](https://wikipedia.org/wiki/SHA-1) assigned to each change of code rendering the more atomic than possible. 
It is a good software versioning, because each version is unique. But not very handy to use in our use case, because it does not human readable or user friendly, 
without additional information in the naming. And each software change has a version, what is a lot. 

A software version is a unique identifier to distribute a software to users in a particular state with features and maintenance. So the development team of a 
software wishes to reduce the number of supported versions exposed to their clients, and wants to package these changes to propose a software as a product 
with coherent features. That is why another software versioning is applied often above these commit identifiers, then the usage of Git tag and/or Git release 
is privileged.

# Example for Java/Scala

A Java/Scala library is compiled to a platform-independent format called JVM bytecode and stored in .class files. These class files are zipped in JAR files for distribution.

# References

* https://en.wikipedia.org/wiki/Software_versioning
* https://doc.akka.io/docs/akka/current/common/binary-compatibility-rules.html
* https://semver.org/
* https://www.scala-lang.org/blog/2021/02/16/preventing-version-conflicts-with-versionscheme.html
* https://docs.scala-lang.org/overviews/core/binary-compatibility-for-library-authors.html
* https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html
* https://github.com/jatcwang/binary-compatibility-guide
* https://github.com/lightbend/mima
* https://wiki.openjdk.java.net/display/csr/Kinds+of+Compatibility
