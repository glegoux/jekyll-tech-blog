---
title: "Software versioning"
description: "How is assigned a version to a software?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Development"
---

# What is a software version? 

A software is a dynamic set of lines of code, that evolves discretely from state to state in function 
of time. To identify a specific state of a software, a versioning can be used whether it be for a
language compiler, a library, a web API, an application, a server, or a client. Of course a versioning 
can be used more generally for any project, but here I focus only on the **software versioning** at large.

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

The software versioning is the process to assign a version to a state of a software: 
a **version scheme** and a **version strategy** are chosen to track the successive evolutions. 
For example, with a version control system as [Git](https://git-scm.com/), the history of a 
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

Here the version scheme is a [SHA1-hash](https://wikipedia.org/wiki/SHA-1), where the version strategy is 
to assign a new version to each change of code rendered the more atomic than possible. It is a software 
versioning handy for development team, because each version is unique and points to each different change
in the code base. But not very useable for the users of this software, because a given version is not
human readable or user friendly, no useful information is given by this complex naming. And each change
has a version, what makes too many existing versions with a naming not discriminant, to know which
versions are important except the last one. 

A software version is a unique identifier to distribute a software also to users. But the development team 
of a software wishes to reduce the number of supported and maintained versions exposed to their clients,
and wants to package these changes to propose a software as a product with coherent features. That is why
another software versioning is applied often above these commit identifiers, and the usage of Git tag
and/or Git release is privileged.

# What are the features of a software version?

As we have seen above, a software can have **several versioning systems**, for example one used internally 
by the development team, and one exposed externally to users.

In addition to be **unique identifiers**, the versions are often ordered to know if a version is more
recent than another. So the naming of a version repects a **semantics**, that contains this order and 
additional meanings. 

The publication of a new version follows a **lifecycle** with a workflow and a process. This publication 
produces a distributable format of the software called **archive** or **package**. The version is 
assigned to the archive that is **signed by the software provider identity** with a hash function on the
content of the archive to guarantee that once a particular version is published, this one remains
immutable and author of this archive is well the official provider of this software.

A software can have **direct** and **transitive dependencies** that are also a versioning, and can be 
also a **dependency of another software**. So, the question is raised of the compatibility between
the different versions.

There are two directions to describe compatibility between 2 versions of a same software:

* **Backward compatible** means that a newer version can be used successfully in an context where an older 
version is expected.
* **Forward compatible** means that an older version can be used successfully in an context where a newer 
version is expected. 
* **Fully compatible** means backward compatible and forward compatible.

Backward compatibility is often guaranteed, but forward compatibility is not. Compatibility depends on a
context of use, if the use is not exhaustive, it should be noted that compatibility is only guaranteed for
this use. Otherwise, implicitly, compatibility is assumed to be true for all possible contexts of use. For
example, full compatibility is only possible in sub-context and not on the global context, otherwise the 2
versions would point to an identical state of the software.

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
