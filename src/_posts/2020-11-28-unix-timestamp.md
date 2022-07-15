---
title: "Unix timestamp"
description: "What could happen in 2038 with the Y2K38 problem?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Applied Mathematics"
tags: ["Arithmetic"]
---

In fact, 2038 is a particular year when an informatics bug could occur, sometimes referred as the **Y2K38 problem**. 
Because an **arithmetic overflow** on the Unix timestamp risks appearing, what it means, there are insufficient bits in a 
binary number representation to portray the result of an arithmetic operation. For example, an arithmetic operation 
is not closed with respect to addition, subtraction, multiplication, or division.  

> Y2K38 problem is caused by insufficient capacity used to represent a time duration:  
> the Unix timestamp as a signed 32-bits integer. It could produce a huge chaos.

&nbsp;

# Unix timestamp

Effectively, the **Unix timestamp**, used largely in informatics systems, represents the number of
elapsed seconds since January 1st, 1970 at midnight in the Coordinated Universal Time (UTC) time standard.
This value is incremented every second. And the date `1970-01-01 00:00:00 UTC`, usually called **epoch date**, 
is a particular date in a lot of informatics system representing the origin time, inherited of the Unix operating system
an POSIX standard. The Unix engineers picked this date arbitrarily, because they needed to set a uniform date for the start of time, 
and New Year's Day, 1970, seemed most convenient.

As you can see:

~~~ terminal
$ for s in $(seq 0 3); do date --date "1970-01-01 00:00:00 UTC $s seconds" +%s; done
0
1
2
3
~~~

A Unix timestamp is used to known the occurrence date of an informatics event, after 1970. Sometimes other 
granularity of time like the millisecond, or the nanosecond are used, but traditionally it is the second. 

<div class="info">
While the trademark today is UNIX, in this article, we use Unix in deference to dmr's wishes, dmr being the 
username of Dennis MacAlistair Ritchie, famous computer scientist having worked the on Unix operating system.
</div>

# Arithmetic binary representation overflow

But the arithmetic binary representation of this Unix timestamp is sometimes on **32-bits as a signed integer** again as 
originally at its creation. That is to say, its maximum value is $ 2^{31} - 1 $. The negative values until $ -2^{31} 
$ (inclusive) are used by convention for representing a duration from `1970-01-01 00:00:00 UTC` to an anterior date. 
Then the maximum duration time supported by a such Unix timestamp will be reach out at `2038-01-19 03:14:07 UTC`:

~~~ terminal
$ date --date "@$((2**31 - 1))" --utc
Tue Jan 19 03:14:07 UTC 2038
~~~

The **adding of 1 second at this date** raises an arithmetic overflow error. For a representation on **32-bits 
as an unsigned integer**. The problem will be the same in 2106:

~~~ terminal
$ date --date "@$((2**32 - 1))" --utc
Sun Feb  7 06:28:15 UTC 2106
~~~

Hopefully, the majority of informatics technology have already migrated to a **64-bits representation**. For a signed integer,
this problem is rescheduled for around in 290 billions of years, in other words in a **quantity quasi-infinity of time**, knowing the 
age of the universe is estimated around 13 billions of years, or around 20 times less. With the approximate computation:

~~~ scala
scala> Long.MaxValue/(365*24*3600)/Math.pow(10, 9)
res: Double = 292.471208677
~~~

The problem could be considered as resolved. But **some informatics system could be bugged** by the **negligence** or the **ignorance** of this problem 
from developers and/or maintainers of these informatics systems. The informatics system uses often **a lot of dependencies** like code libraries, 
hardware components, or operating systems. Only one of the dependency could be the source of a such bug in the related informatics systems that uses it, 
because the Unix timestamp are omnipresent on each system layer from low level to high level. 

Concretely, it raises an **arithmetic overflow error**. It could be silent, trigger a coding exception, or have a different behavior.
For example for the most programming languages, it will be silent for the programmer but with a different behavior. 
Even if the test policy of the coding project could catch this kind of error. It is enough rare to have a unit or integration test 
with the current time or a future time, often the time is fixed to have an exact reproducible test. But it could be observed in 
the end-to-end test. In any case, **the error will appear firstly at the runtime directly in production**. 

It could produce a chaos, because the consequences of a such error are hard to forecast, with a risk to be destructive.
Events can be not synchronized between several systems or just stop working: internet, cars, IoT devices, banks, airplanes, etc ... 
suddenly could no longer work.

# Example in Java/Scala 

While currently Java/Scala ecosystem is not exposed to this problem in the standard library, 
with a signed 64-bits representation for an Unix timestamp:

~~~ scala
scala> import java.time.Instant; Instant.now().getEpochSecond.isInstanceOf[Long]
res: Boolean = true
~~~

A Unix timestamp is well represented by a `Long` from $-2^{63}$ to $2^{63} - 1$. Let's study together, what it could happen, if it was a `Int`.  
The range of values will be between $-2^{31}$ and $2^{31} - 1$ for a `Int`.

~~~ scala
scala> Int.MinValue
res: Int = -2147483648
scala> Int.MaxValue
res: Int = 2147483647
~~~

<div class="warning">
In Scala, it is false to express $2^{31}$ with Math.pow(2, 31).intValue that is equal to 2147483647, what it doesn't make sense.
Here, you have a odd number instead of an even number, and typically an arithmetic overflow per truncation from Double to Int.
</div>

In addition we have:

~~~ scala
scala> Int.MaxValue + 1 == Int.MinValue
res: Boolean = true
~~~

The adding of 1 second after `Tue Jan 19 03:14:07 UTC 2038` gives:

~~~ terminal
$ date --date "@$((-2**31))" --utc
Fri Dec 13 20:45:52 UTC 1901
~~~

Weird, how could we explain that. The error is silent no exception raised, the addition provoking the arithmetic overflow is cyclic on the 
arithmetic representation. Because, here a `Int` has a **two's complement binary representation** (2C) in Scala.
Here the relation between the base 10 and the two's complement binary representation on 32-bits is:

$$ [N]_{10} = [b_{31}\,...\,b_{1}\,b_{0}]_{2C} = - b_{31}\,2^{31} + \sum_{i=0}^{30} b_{i}\,2^{i} \text{ where } b_k \,\in\, \{ 0,1 \} $$

with the notation **little endian** for the order of the bits, the most significant bit (MSB) $ b_{31} $ is the **sign bit** 
and the least significant (LSB) bit $ b_{0} $ the **unit bit**. It the sign bit is 1, the number is stricly negative. And if the unit bit is 1, the numbder is odd. For example:

~~~ scala
def toBinaryRepresentation(i: Int): String =
    i.toBinaryString.reverse.padTo(32, '0').reverse

scala> toBinaryRepresentation(Int.MinValue)
res: String = 10000000000000000000000000000000

scala> toBinaryRepresentation(-1)
res: String = 11111111111111111111111111111111

scala> toBinaryRepresentation(0)
res: String = 00000000000000000000000000000000

scala> toBinaryRepresentation(Int.MaxValue)
res: String = 01111111111111111111111111111111
~~~

To conclude the limitations of storage capacity for a value can provoke weird bugs in an informatics ecosystem, 
it is important to be aware of this kind of behavior when a technology is used.

# References

* RITCHIE Dennis M., THOMPSON Ken, **The UNIX TimeSharing System**. Bell Labs, July 1974. [Link](https://dsf.berkeley.edu/cs262/unix.pdf).
* NYGREN Erik, **Preparing for Y2038 (ALREADY?!)**. Akamai Blog, January 2019. [Link](https://blogs.akamai.com/2019/01/preparing-for-y2038-already.html).
* DINAMANI Deepa, **Solving the Year 2038 problem in the Linux kernel**. opensource.com, January 2019. [Link](https://opensource.com/article/19/1/year2038-problem-linux-kernel).
* THAKUR Vishal, **What Is The 2038 Problem?**. Science ABC, October 2020. [Link](https://www.scienceabc.com/innovation/what-is-the-2038-problem.html).
