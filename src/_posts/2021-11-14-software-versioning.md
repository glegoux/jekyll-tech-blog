---
title: "Software versioning"
description: "How is assigned a unique version names to a software ?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Development"
tags: [""]
---

A software can be viewed as a set of line of codes that is dynamic, that is to say that evolves discretely from a 
state to a new state in function of time. To identify a specific state of this software a versioning system is often 
used whether it be for a language compiler, a library, a web API, an application, a server, or a client. Of course of 
version system can be used more generally for any project, but here I focus only on a software.

<figure>
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
scheme and a version strategy to track the evolution of the software. For example, with a version control system as [Git](https://git-scm.com/), 
the history of a software is split into commits, where each commit identifier can be used as a version scheme. 

<figure>
<pre>
40551405dc02afe8240024c952fa1de953fc2ff9 Commit message: State 3
3982dcd90b486eab39eb610ec5e7e5963b92ab33 Commit message: State 2
32f0469eb344029bd1ecf5b0626685f2fa795f47 Commit message: State 1
...
</pre>
<figcaption>Commit logs with commit identifier and message</figcaption>
</figure> 

Here the version scheme is a [SHA1-hash](https://wikipedia.org/wiki/SHA-1) assigned to each change of code that renders the more atomic as possible. 
It is a good software versionning, because the each version scheme is unique, but very handly to use in our use case, 
because doesn't contain each additional information and each change has a version, what is a lot. 

A version is an identifier to distribute the software to users with maintenance and evolutions. The development team of the software wishes 
to reduce the number of supported versions to its clients, and package these changes to propose a software as a product with coherent features.
For this, another software versioning is used above the given but the commit identifiers, then the use of the Git tag or the Git release are privileged.

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
