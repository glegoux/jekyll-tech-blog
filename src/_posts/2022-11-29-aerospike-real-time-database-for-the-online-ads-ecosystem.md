---
pinned: false
title: "Aerospike: Real-time database for the online ads ecosystem"
description: "Let’s discover the deployment of Aerospike on Kubernetes clusters at scale as a distributed key-value store for the online ad market"
authors: ["glegoux"]
time_reading_minutes: 8
category: "Data"
---

[Aerospike](https://aerospike.com/)  can replace at the same time 2 cache layers, an in-memory layer, and a persistent memory layer like  [Memcached](https://memcached.org/)  and  [Couchbase](https://www.couchbase.com/), respectively, with awesome performance.

Especially explore the usages of this distributed key-value store for the e-commerce catalogs indispensable in the online ads ecosystem to build ad campaigns, recommend products to the right audience, and display the ads for the publishers.

As a member of catalog teams at Criteo, I was at the last meetup of  [Scale Warriors Aerospike](https://www.meetup.com/aerospike-paris-scale-warrior-meet-ups/events/289187127/), where the CTO (and founder at Aerospike) was present  [Srini V. Srinivasan](https://www.linkedin.com/in/drvsrini/)  to share new and existing features of Aerospike, and where Criteo presented its plan and strategy to migrate to Aerospike.

# Aerospike

**Aerospike**  is a key-value NoSQL database with  [flash memory](https://en.wikipedia.org/wiki/Flash_memory)  and  [in-memory](https://en.wikipedia.org/wiki/In-memory_database)  [open source](https://github.com/aerospike). The high-level ecosystem of Aerospike is deeply integrated with tools of the Big data ecosystem for streaming, batch, and SQL usages with  [Kafka](https://www.confluent.io/lp/apache-kafka/),  [Spark](https://spark.apache.org/), and  [Trino](https://trino.io/)  with a  [Java client](https://developer.aerospike.com/client/java):


{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*83KoE4CmWbOJFgxFU6paeQ.png"
abs_url=true
title="The Aerospike Real-time Data Platform"
source="https://aerospike.com/developer/blog/database-queries-json-db-6"
%}

Aerospike is a distributed key-value store. You can access the data with a simple API:

> Get(key) -> byte[]  
> Set(key, byte[], ttl)

The goal is to have small objects from a few bytes to 4 MiB, with low latency, 1 ms on average, and 5 ms at the 99th percentile.

**Aerospike is first optimized for the OLTP paradigm because it is a KV Store.** Still, you can easily do OLAP queries for other usages for more exotic queries to scan the data thanks to the data models layer for Documents, SQL, Graphs, or Time Series.

# Aerospike clusters at Criteo

A DKVS plays a central role in online ads. With this storage, the infrastructure can answer to the small-time budgets required for each business use case: to bid a request for the auction of RTB (< 100 ms) or to render the ads (< 250 ms).


{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*huw1bvBiZIDuDliExf6bOg.png"
abs_url=true
title="Time budget for the online ads"
source="https://www.meetup.com/aerospike-paris-meet-ups/events/289187127"
%}

The tech stack is diversified to respond to the needs of online ads, and a DKVS is insufficient. It is only a part of the ecosystem:

{% include content/image.html
src="https://miro.medium.com/v2/resize:fit:700/1*2czh312iW3IsFkVU1YfW3w.png"
abs_url=true
title="Data stack at Criteo"
source="https://www.meetup.com/aerospike-paris-meet-ups/events/289187127"
%}

The data stored in the KV stores must be persisted and loaded in memory to access long-term and quick readings.

{% include article/read-more.md
src="https://medium.com/@glegoux/aerospike-real-time-database-c88066769274"
%}

