---
pinned: false
title: "Apache Spark: Ecosystem overview with Apache Hadoop YARN and HDFS"
description: "Though my experience of Software Engineer @Criteo during several years to import and enrich e-commerce catalogs. I would like to share with a large overview how Spark works and can be used in the data Industry to manage data processing at scale."
authors: ["glegoux"]
time_reading_minutes: 10
category: "Data"
---

Apache Spark: ecosystem overview with Apache Hadoop YARN and HDFS[Apache Spark™](https://spark.apache.org/)  is a multi-language engine for executing data engineerinApache Spark: ecosystem overview with Apache Hadoop YARN and HDFSg, data science, and machine learning on single-node machines or clusters. It is largely used in the industry for distributed computation of data at scale.

This project is  [open-source](https://github.com/apache/spark)  under the  [Apache software foundation,](https://apache.org/)  created by the founders of the company  [Databricks](https://www.databricks.com/)  that provides cluster and support for Spark.

Let deep dive on the architecture of  **Apache Spark on YARN** in a distributed ecosystem of containers and  **Java VMs**.

This architecture need to address the  **computation**  and the  **storage**  at  **high scale**  to manipulate big volume of data with an efficient processing.

**Table of contents**

-   Spark ecosystem
-   Spark architecture through Hadoop
-   Spark engine for computation and storage
-   Go with Spark in production
-   Example of Spark application at Scale
-   Go further
-   What’s next
-   Thanks to
-   Glossary
-   References

Let’s start with the basics, you can jump straight to the sections that interest you, otherwise see vertically how this whole ecosystem works.

# Spark ecosystem

## Data pipelines

Spark allows building data pipeline in  **batch mode** and the  **streaming mode**.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:408/0*zqTHvZ2Uckv_Hjz3.png"
abs_url=true
title="Lambda architecture with Spark"
source=true
%}

Here, you see a  **lambda architecture**, but to associate online and offline processing, you can have a  **kappa**  or  **zeta**  **architecture**  on your data pipeline. You will see it in another article.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:394/1*4QrgYLPJto1TBvMcs45iqg.png"
abs_url=true
title="Spark vs Spark Streaming"
source_author="https://www.databricks.com/blog/2020/11/20/delta-vs-lambda-why-simplicity-trumps-complexity-for-data-pipelines.html"
%}

The streaming mode of Spark is more micro-batch approach. Other framework like  [Kafka Streaming](https://kafka.apache.org/documentation/streams/),  [Faust Streaming](https://faust-streaming.github.io/faust/)  or  [Apache Flink](https://flink.apache.org/)  are more used to process data streams. Spark is forceful to process data batch overall.

## APIs

Mainly, Spark can run with several APIs, one for each following programming language  [Scala](https://spark.apache.org/docs/latest/api/scala/org/apache/spark/index.html)/[Java](https://spark.apache.org/docs/latest/api/java/),  [Python](https://spark.apache.org/docs/latest/api/python/)  and  [R](https://spark.apache.org/docs/latest/api/R/), respectively with  **Spark**,  **PySpark**  and  **SparkR**.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*zXXVD_S-pBs8mWBi3OcR7w.png"
abs_url=true
title="Different types of Spark engines"
source_author=true
%}

In practice, Spark and PySpark are more used than SparkR. For the experimentation, PySpark is more helpful, and for the performances Spark is better.

## Connectors

Spark has many  **connectors**  to write  **to different types of storage**.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:684/0*uQtzEnoXUORb2dgi"
abs_url=true
title="Apache Spark’s ecosystem of connectors"
source="https://pages.databricks.com/rs/094-YMS-629/images/LearningSpark2.0.pdf"
%}

Here, we are going to speak a bit more about the connection with Apache Hadoop HDFS.

## Spark SQL

In addition, you can also run Spark with  [SQL](https://spark.apache.org/docs/latest/api/sql/). With a SQL request, you can also access to heterogeneous data then combine them in memory:

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:720/format:webp/0*Ts-DH76DiRFZh4p1.png"
abs_url=true
title="Spark SQL overview"
source="http://www.gatorsmile.io/sparksqloverview/"
%}

The  [Catalyst & Tungsten](https://www.linkedin.com/pulse/catalyst-tungsten-apache-sparks-speeding-engine-deepak-rajak/) engines allows optimizing the execution plan of the query:

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/0*CRcfOe8vbDWNGJhV.png"
abs_url=true
title="Catalyst"
source="https://www.databricks.com/glossary/catalyst-optimizer"
%}

## PySpark

In the Python driver program, SparkContext uses  [Py4J](https://www.py4j.org/)  to launch a JVM and create a JavaSparkContext. Py4J is only used on the driver for local communication between the Python and Java SparkContext objects; large data transfers are performed through a different mechanism.

{% include article/read-more.md
src="https://medium.com/@glegoux/apache-spark-ecosystem-with-hadoop-apache-yarn-and-hdfs-8e64eeba68c0"
%}


