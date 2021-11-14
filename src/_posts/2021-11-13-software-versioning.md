---
title: "Software versioning"
description: "How is assigned a version to a software?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Development"
---

# What is a software version? 

A software is a dynamic set of lines of code and/or data, that evolves discretely from state 
to state in function of time. To identify a specific state of a software, a versioning system 
can be used whether it be for a language compiler, a library, a web API, an application, a 
server, or a client. Of course a versioning system can be used more generally for any project, 
but here I focus only on the **software versioning** at large.

<figure>
<pre class="notranslate">
             ┌─────────┐           ┌─────────┐           ┌─────────┐
             │         │           │         │           │         │
  ──────────►│ State 1 ├──────────►│ State 2 ├──────────►│ State 3 │─────────►
             │         │           │         │           │         │
             └─────────┘           └─────────┘           └─────────┘
</pre>
<figcaption>Software states</figcaption>
</figure> 

The software versioning is the process to assign a version to a software: a version system 
is chosen with a **version scheme** and a **version strategy** to track the evolutions. For 
example, with a version control system as [Git](https://git-scm.com/), the history of a 
software is split into commits, where each commit identifier is used as a version. 

<figure>
<pre class="notranslate">
40551405dc02afe8240024c952fa1de953fc2ff9 Commit message: State 3
3982dcd90b486eab39eb610ec5e7e5963b92ab33 Commit message: State 2
32f0469eb344029bd1ecf5b0626685f2fa795f47 Commit message: State 1
...
</pre>
<figcaption>Commit logs with commit identifier and message</figcaption>
</figure> 

Here the version scheme is a [SHA1-hash](https://wikipedia.org/wiki/SHA-1) assigned to each change of 
code rendered the more atomic than possible. It is a good software versioning handy for development 
team, because each version is unique and points to each different change in the code base. 
But not very useable for the users of this software, because it does not human readable or user 
friendly, without additional information in the naming. And each software change has a version, 
what makes too many existing versions. 

A software version is a unique identifier to distribute a software to users in a particular state with
features and maintenance. So the development team of a software wishes to reduce the number of supported
versions exposed to their clients, and wants to package these changes to propose a software as a product
with coherent features. That is why another software versioning is applied often above these commit
identifiers, then the usage of Git tag and/or Git release 
is privileged.

# What are the features of a software version?

As we have seen above, a software can have several version systems, for example one used internally 
by the development team, and one exposed to users of this software.

In addition to be composed of a set of unique identifier, the version system is often ordered to know 
if a version is more recent than another. The naming of a version repects a semantics that gives a 
meaning to this naming. 

The publication of a new version respects a lifecycle with a workflow and a process. This publication 
has a distributable format where the software is packaged into an archive. The version is signed by 
the software provider identity with a hash function on the content of the archive to guarantee that once a
particular version is published, this one remains immutable and author of this archive is well the
official provider of this software.

# How to build a software version?

Breaking change, compatibility, Changelog, releases, alpha, beta, dependencies

For example, [Ubuntu versioning](https://ubuntu.com/about/release-cycle), [SDK/JRE versioning](https://www.oracle.com/java/technologies/javase/versioning-naming.html), ...

# Example for Java/Scala

A Java/Scala library is compiled to a platform-independent format called JVM bytecode and stored in 
`.class` files. These class files are zipped in JAR files for distribution.

# References

* <https://en.wikipedia.org/wiki/Software_versioning>
* <https://doc.akka.io/docs/akka/current/common/binary-compatibility-rules.html>
* <https://semver.org/>
* <https://www.scala-lang.org/blog/2021/02/16/preventing-version-conflicts-with-versionscheme.html>
* <https://docs.scala-lang.org/overviews/core/binary-compatibility-for-library-authors.html>
* <https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html>
* <https://github.com/jatcwang/binary-compatibility-guide>
* <https://github.com/lightbend/mima>
* <https://wiki.openjdk.java.net/display/csr/Kinds+of+Compatibility>
