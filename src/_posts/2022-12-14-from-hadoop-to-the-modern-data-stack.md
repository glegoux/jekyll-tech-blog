---
pinned: false
title: "From Hadoop to the modern data stack"
description: "I was at the meetup From Hadoop to the Modern Stack with the companies Criteo, Starbust and Castor with 3 speeches Hadoop and Data processing at Criteo, Data Catalog Costor, and Trino on Apache Iceberg."
authors: ["glegoux"]
time_reading_minutes: 3
category: "Data"
---

# Hadoop at Criteo

by  [Anthony Rabier](https://fr.linkedin.com/in/anthony-rabier-345108100), Staff Site Reliability Lead Engineer at  [Criteo](https://www.criteo.com/)  
and  [William Montaz](https://fr.linkedin.com/in/williammontaz), Senior Staff Site Reliability Engineer at  [Criteo](https://www.criteo.com/).

Criteo migrated from  [Hadoop](https://hadoop.apache.org/docs/stable/)  3 to Hadoop 2, with a lot of patches and in an awesome way by migrating first the runtime to Hadoop 3 for a big progressively without downtime for Hadoop YARN and HDFS without any intervention of the development teams, then by migrating the Hadoop projects for Spark, Flink, and Hadoop Map Reduce. So a vanilla distribution of Hadoop 3 has been created, running with compiled projects in Hadoop 2 and 3 with retro compatibility and tricks developed and merged by Criteo in the core project of Hadoop.

![](https://miro.medium.com/v2/resize:fit:318/0*Ca5vwq5jxI-Qq2m_)

Migration from Hadoop 2 to Hadoop 3

[Garmadon](https://github.com/criteo/garmadon)  is an agent java deployed with all JVM processes running on the Criteo Hadoop cluster to do the metrology jobs for Spark, Flink, and Hadoop Map Reduce … You can build generic Grafana dashboards and create data lineage between your dataset and audit all operations on HDFS.

![](https://miro.medium.com/v2/resize:fit:700/0*OSMVeNYwRB6fQMSC)

Garmadon, Java agent for the Metrology on Hadoop

# Data processing at Criteo

by  [Miguel Liroz](https://fr.linkedin.com/in/mliroz), Senior Staff Site Reliability Lead Engineer at  [Criteo](https://www.criteo.com/)  
and  [Raphael Claude](https://www.linkedin.com/in/raphaelclaude), Staff Site Reliability Engineer at  [Criteo](https://www.criteo.com/)

Datadoc is an internal tool used by Criteo to browse the data catalog and to provide a data catalog on each dataset.


{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*UD_BHWOi4vMzm_vEQQthvg.png"
abs_url=true
title="Datadoc"
source_author=true
%}

[BigDataFlow](https://medium.com/criteo-engineering/scheduling-data-pipelines-at-criteo-part-1-8b257c6c8e55)  is an internal tool used by Criteo written in Scala to schedule data processing jobs from an extended SQL query.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*cRzS5MJ4IiErfXQ82Sz5Ug.png"
abs_url=true
title="BigDataFlow extended SQL"
source_author=true
%}

{% include article/read-more.md
src="https://medium.com/@glegoux/from-hadoop-to-the-modern-stack-cdb2f10cee31"
%}


