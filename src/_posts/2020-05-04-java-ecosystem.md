---
title: "Java ecosystem"
description: "What is the Java ecosystem from Sun to Oracle?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Development"
tags: ["Language", "Java"]
---

The Java language is initiated by **James Gosling**, **Mike Sheridan** and **Patrick Naughton** is June **1991**. After several years,
the company **Sun Microsystems** released the first version of Java. Here its principles: 

1. It must be simple, object-oriented, and familiar.
2. It must be robust and secure.
3. It must be architecture-neutral and portable.
4. It must execute with high performance.
5. It must be interpreted, threaded, and dynamic.

{% include content/image.html title="Java logo" src="java-logo.png" %}

That is to say:

> Java is C++ without the guns, clubs and knives.

James Gosling, one of inventors of Java language

Java is a **most famous programming language**, it is in the **top 10** of the languages 
the most **present on the Internet resources** and with the highest number of contributors 
respectively with the [TIOBE index](https://www.tiobe.com/tiobe-index/programming-languages-definition) 
that counts the search engine hits, and the [octoverse](https://octoverse.github.com)
annual report of Github that counts the number of unique contributors of java projects.

But the mascot of Java is [Duke](https://www.oracle.com/java/duke.html) that plays the role of a *software agent* 
that performed tasks for the user:

{% include content/image.html title="Duke the Java mascot" src="duke.png" %}

The best resource about Java is surely the *Effective Java* book with its different editions:

> Learning the art of programming, like most other disciplines,  
> consists of first learning the rules and then learning when to break them.

Joshua Bloch, author of Effective Java

{% include content/image.html title="Effective Java book" src="effective-java-book-cover.jpg" %}

But Sun Microsystems had an issue a business model, and **Oracle acquired Java in January 2010**. 
Now the project has 2 main versions, an **open source version with OpenJDK** and **commercial version with Oracle JDK**.
These both Java Development Kit are available respectively at <https://openjdk.java.net> and <https://www.oracle.com/java>.

There are **several JDK vendors among AdoptOpenJDK, Amazon Correto, SAP, Red Hat, Azul, IBM**. 
The most of the vendors have a project based on OpenJDK. The Java Community Process (JCP) 
provides a **Technology Compatibility Kit** (TCK) to certify whether a JDK build meets 
the Java standards. Once a build passes the TCK, it can be referred to as `Java SE compatible`.
The certification process requires a commercial license from Oracle.

You can see, what is the usage of the Java ecosystem in terms of IDE, Java vendors, Java version, Java 
with the Snyk company survey, or the Jrebel company survey.

To follow the evolution of the ecosystem, you can subscribe to the Java magazine. 

**References:**

* <https://blogs.oracle.com/java-platform-group/the-arrival-of-java-14>
* <https://dzone.com/articles/an-overview-on-jdk-vendors>
* <https://blog.overops.com/java-wish-list-the-top-differences-between-java-scala-groovy-clojure-and-kotlin>
* <https://mreinhold.org/blog/forward-faster>
* <https://www.jrebel.com/blog/2020-java-technology-report>
* <https://blogs.oracle.com/java-platform-group/faster-and-easier-use-and-redistribution-of-java-se>
* <https://www.developpez.com/actu/159181/Oracle-annonce-des-changements-pour-Java-SE-deux-versions-par-an-licence-GPL-des-fonctionnalites-commerciales-du-JDK-d-Oracle-en-open-source>
* <https://www.developpez.com/actu/185779/Java-8-ne-va-plus-recevoir-de-mises-a-jour-et-correctifs-de-securite-a-partir-de-septembre-a-moins-de-passer-a-un-support-commercial>
* <https://tekcollab.imdeo.com/java-devient-payant>
* <https://www.oracle.com/java/technologies/java-se-support-roadmap.html>
* <https://oss.oracle.com>
* <https://dzone.com/articles/difference-between-jdk-vs-jre-vs-jvm>
* <https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html>
* <https://github.com/search?l=&o=desc&q=stars%3A%22%3E+1000%22+language%3AJava&s=stars&type=Repositories>

{% comment %} 
who's contibutes to OpenJDK
famous tools developped in Java
repository filer on Internet
repository java, jenkins ..., most known tech in java 
apache, google, microsoft ...

IntelliJ, sdkman, toolbox, gradle

conferences Java et tutorial

Java ecosystem is composed of several master of pieces
JVM,JRE,JDK,Java SE Compatible.

Scala, Groovy, Kotlin, Closure, Jruby
JEP, JSP, JFR

In computer science, bootstrapping is the technique for producing a self-compiling compiler 
The trick is bootstrapping. You first write a compiler for your language (or a subset thereof) 
in some other language. Then you write a compiler for your language (or a large subset of the one you can already handle) 
in your language. You use the former compiler to compile the new compiler, and then the new compiler can compile itself.
{% endcomment %}
