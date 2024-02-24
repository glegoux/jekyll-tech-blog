---
pinned: true
title: "Learning PySpark with Google Colab"
description: "PySpark on Google Colab is an efficient way to manipulate and explore the data, and a good fit for a group of AI learners."
authors: ["glegoux"]
time_reading_minutes: 10
category: "Data"
---

Learning  [**Apache Spark**](https://spark.apache.org/)  with a quick learning curve is challenging. Discover  **distributed computation**  and  **machine learning**  with  [PySpark](https://www.databricks.com/glossary/pyspark), with  **several tutorials**  until building your movie recommendation engine.

**Links:** [GitHub](https://github.com/criteo-research/master-iasd/tree/master/module4)  \|  [Tutorials quick start](https://colab.research.google.com/github/criteo-research/master-iasd/blob/master/module4/td1/td1-rdd-questions.ipynb)  \|  [Dataset](https://grouplens.org/datasets/movielens/)

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:359/1*HZloIx45zZtPrtcEksmeRw.png"
abs_url=true
%}

Let’s discover how to use PySpark on Google Colab with accessible tutorials.

As a teaching fellow with  [David Diebold](https://www.linkedin.com/in/david-diebold-51249977/)  about  [Systems, paradigms, and algorithms for Big Data](https://www.lamsade.dauphine.fr/wp/iasd/en/programme/options/systemes-paradigmes-et-langages-pour-les-big-data/)  for the international  [Master IASD](https://www.lamsade.dauphine.fr/wp/iasd/en/)  ([graduate degree M2](https://www.universite-paris-saclay.fr/en/education/french-higher-education-system)) for the French  [Dauphine Paris University](https://dauphine.psl.eu/)  member of the  [PSL University](https://psl.eu/en), I needed to organize sessions of tutorials for the students on the distributed computation with  [**Apache Spark**](https://spark.apache.org/).

**Fast, flexible, and developer-friendly**, this  **data-distributed processing**  framework has become  **one of the world’s most significant**. Before teaching the features provided by Spark, we had to choose  **which language and platform**  our learners could run the tutorials we prepared. We chose the tech stack:  **PySpark with Google Colab**.

# PySpark vs. Spark

[**PySpark**](https://www.databricks.com/glossary/pyspark)  allows interaction with Spark in  **Python**. It gives a  **better learning curve**  than Spark (written originally in Scala). Even though it is less performant for a production world using  [Py4J](https://www.py4j.org/)  to interact with the JVM of Spark, it gives  **sufficient performance**  (sometimes close to Spark with Java/Scala) to experiment with distributed data science and machine learning.

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:571/1*jLK8saUaKj8KuovUgXumUg.png"
abs_url=true
title="PySpark is an interaction of Spark with Python"
source_author=true
%}

PySpark with Python remains largely the  **preferred language**  for  **Notebooks.**

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:344/1*L8jzF1__70sSDfflDM5CBg.png"
abs_url=true
title="Percent of commands on the Databricks platform in each Spark language "
source="https://www.databricks.com/blog/2020/06/18/introducing-apache-spark-3-0-now-available-in-databricks-runtime-7-0.html"
%}

The  **support**  of PySpark is already  **excellent**  and continues to be improved with the future version of  [**Spark 3+**](https://www.databricks.com/blog/2020/06/18/introducing-apache-spark-3-0-now-available-in-databricks-runtime-7-0.html).

Python is  **easier to learn**  than Scala and has a  **mature ecosystem for applied mathematics**.

For these reasons,  **we preferred teaching PySpark over Spark**. Moving from one to another is easy, only the cost for the learners to become familiar with the Scala/Java ecosystem for advanced use.

{% include article/read-more.md
src="https://medium.com/@glegoux/apache-spark-pyspark-with-google-colab-for-data-science-63478138a63e"
%}

