---
layout: article
article: true
permalink: /blog/article/getting-started
cover: "getting-started.jpg"
title: "Getting Started"
description: "Markdown is a lightweight and easy-to-use syntax for styling all forms of writing on this blog."
time_reading_minutes: "10"
categories: ["Methodology"]
---

# Text

## Highlight

Use Github markdown https://guides.github.com/features/mastering-markdown/ or nearly.

Italics: *italics* or _italics_  
Bold:	**bold** or __bold__  
Strikethrough: ~~Strikethrough~~  
Bold & Italics: **_bold italics_** or __*bold italics*__

Source code:
~~~
Italics: *italics* or _italics_  
Bold:	**bold** or __bold__  
Strikethrough: ~~Strikethrough~~  
Bold & Italics: **_bold italics_** or __*bold italics*__
~~~

## Structures of articles

Make a part, a subpart and a sub-subpart:

Source code:
~~~
# H1
## H2
### H3


H1
======

H2
------
~~~

## List

1. item1
2. item2
3. item3
4. item4

Source code:

~~~
1. item1
2. item2
3. item3
4. item4
~~~

## Quote

> Talk is cheap. Show me the code.

Linus Torvalds

Source code:
~~~ @escape
> Talk is cheap. Show me the code.

Linus Torvalds
~~~

## Emoticon

Use Github emoji,  https://www.webpagefx.com/tools/emoji-cheat-sheet/

:smile: :scream: :yum:

Source code:
~~~ @escape
:smile: :scream: :yum:
~~~

## Links

Simple link (works with absolute and relative link):

[Google](https://www.google.com)

Source code:
~~~
[Google](https://www.google.com)
~~~

Simple link with title:

[Google](https://www.google.com "Google's Homepage")

Source code:
~~~
[Google](https://www.google.com "Google's Homepage")
~~~

You can use shortcut for your links to use that several times on article or to centralize links:

[Google1][1] [Google2][1]

[1]: https://www.google.com

Source code:
~~~
[Google1][1] [Google2][1]

[1]: https://www.google.com
~~~

# Notes

## Info

<pre class=" info">
INFO
</pre>

Source code:
~~~
<pre class=" info">
INFO
</pre>
~~~

## Question

<pre class="question">
QUESTION
</pre>

Source code:
~~~
<pre class="question">
QUESTION
</pre>
~~~

## Warning

<pre class="warning">
WARNING
</pre>

Source code:
~~~
<pre class="warning">
WARNING
</pre>
~~~

## Error

<pre class="error">
ERROR
</pre>

Source code:
~~~
<pre class="error">
ERROR
</pre>
~~~

# Programming code

## Terminal

~~~ terminal
$ command
result
~~~

Source code:

<pre>
~~~ terminal
$ command
result
~~~
</pre>

## Python

~~~ python
print("Hello world!")
~~~

Source code:

<pre>
~~~ python
print("Hello world!")
~~~
</pre>

## Java

~~~ java 
System.out.println("Hello world!");
~~~

Source code:
<pre>
~~~ java 
System.out.println("Hello world!");
~~~
</pre>

## Bash

~~~ bash
echo "Hello world!"
~~~

Source code:

<pre>
~~~ bash 
echo "Hello world!"
~~~
</pre>

## Ruby

~~~ ruby 
puts "Hello world!"
~~~

Source code:
<pre>
~~~ ruby 
puts "Hello world!"
~~~
</pre>

## Go

~~~ go
import("fmt")

fmt.Println("Hello world!")
~~~

Source code:
<pre>
~~~ go
import("fmt")

fmt.Println("Hello world!")
~~~
</pre>

## JavaScript

~~~ javascript
console.log("Hello world!");
~~~

Source code:
<pre>
~~~ javascript
console.log("Hello world!");
~~~
</pre>

## HTML

~~~ html
<p>Hello world!</p>
~~~

Source code:
<pre>
~~~ html
&lt;p&gt;Hello world&lt;/p&gt;
~~~
</pre>

## CSS

~~~ css
.hello-world {
  text-align: center
}
~~~

Source code:
<pre>
~~~ css
.hello-world {
  text-align: center
}
~~~
</pre>

# Format text file

## Plain text 

~~~
"Hello World!"
~~~

Source code:
<pre>
~~~
"Hello World!"
~~~
</pre>


## JSON

~~~ json
{"message": "Hello World!"}
~~~

Source code:
<pre>
~~~ json
{"message": "Hello World!"}
~~~
</pre>

## YAML

~~~ yaml
hello:
  world: "Hello World!"
~~~

Source code:
<pre>
~~~ yaml
hello:
  world: "Hello World!"
~~~
</pre>

## XML

~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<message>Hello World!</message>
~~~

Source code:
<pre>
~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<message>Hello World!</message>
~~~
</pre>

## INI

~~~ ini
[message]
message="Hello World!"
~~~

Source code:
<pre>
~~~ ini
[message]
message="Hello World!"
~~~
</pre>

# Maths

Use LateX syntax, see https://www.latex-project.org .

## Inline formula

This formula $\int_0^1 x^2dx = \frac{1}{3}$ is inline.

Source code:
~~~
$\int_0^1 x^2dx = \frac{1}{3}$
~~~

## Multiline formula

This formula is multiline:

$$
\int_0^1 xdx = \frac{1}{2} \\
\int_0^1 x^2dx = \frac{1}{3} 
$$

Source code:
~~~
$$
\int_0^1 xdx = \frac{1}{2} \\
\int_0^1 x^2dx = \frac{1}{3} 
$$
~~~




