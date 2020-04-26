---
title: "Getting Started"
description: "Markdown is a easy-to-use syntax for writing text on this blog."
authors: ["glegoux"]
time_reading_minutes: "10"
category: "Methodology"
tags: ["Markdown"]
---

[Markdown](https://daringfireball.net/projects/markdown/) is a lightweight and popular text metalanguage which is a writing standard for scientists 
with extension `.md` or `.markdown`.  
It is often converted into HTML what allows it to be easily shared on the web :spider_web:.

After the matching HTML text can be decorate and animate by CSS style sheet and/or JS script: 

{% include image.html title="Markdown processor"
src="https://docs.google.com/drawings/d/e/2PACX-1vRPwfUjnj6bT9B-M4jdzQqOICzCwblxYR5xvgiXYWrpcgpmFddbWR-ErodWf-U0rE8f0aqzUfazXvf8/pub?w=960&amp;h=267" %}

Discover the Markdown syntax used on this blog and more generally on the web.

# Text

## Highlight

Enhance your text:

Italics: *italics* or _italics_  
Bold:	**bold** or __bold__  
Strikethrough: ~~Strikethrough~~  
Bold & Italics: **_bold italics_** or __*bold italics*__  
Inline code: `code`

Source code:

~~~
Italics: *italics* or _italics_  
Bold:	**bold** or __bold__ 
Strikethrough: ~~Strikethrough~~
Bold & Italics: **_bold italics_** or __*bold italics*__
Inline code: `code`
~~~

## New line & paragraph

Let 2 trailing spaces to have an end of line, and let a empty line for a new paragraph:

Hello,  

World!

Source code:

~~~ whitespace
Hello,␣␣\n
\n
World!\n
~~~

*Note: `\n` and `␣` represent respectively a new line character and a space character.*

## Headings

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

Build an ordered list:

1. item
2. item
3. item

Source code:

~~~
1. item
2. item
3. item
~~~

Build a unordered list:

* item
* item
* item

Source code:

~~~
 * item
 * item
 * item
~~~

## Quote

> Talk is cheap. Show me the code.

Linus Torvalds, creator of the Linux operating system

Source code:
~~~ @escape
> Talk is cheap. Show me the code.

Linus Torvalds, creator of the Linux operating system
~~~

## Emoticon

Use [emoji](https://www.webpagefx.com/tools/emoji-cheat-sheet/) :

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

## Notes

### Info

<pre class=" info">
INFO
</pre>

Source code:
~~~
<pre class=" info">
INFO
</pre>
~~~

### Question

<pre class="question">
QUESTION
</pre>

Source code:
~~~
<pre class="question">
QUESTION
</pre>
~~~

### Warning

<pre class="warning">
WARNING
</pre>

Source code:
~~~
<pre class="warning">
WARNING
</pre>
~~~

### Error

<pre class="error">
ERROR
</pre>

Source code:
~~~
<pre class="error">
ERROR
</pre>
~~~

# Informatics code

## Programming language

### <span class="notranslate">Terminal</span>

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

### <span class="notranslate">Python</span>

~~~ python
print("Hello world!")
~~~

Source code:

<pre>
~~~ python
print("Hello world!")
~~~
</pre>

### <span class="notranslate">Java</span>

~~~ java 
System.out.println("Hello world!");
~~~

Source code:
<pre>
~~~ java 
System.out.println("Hello world!");
~~~
</pre>

### <span class="notranslate">Bash</span>

~~~ bash
echo "Hello world!"
~~~

Source code:

<pre>
~~~ bash 
echo "Hello world!"
~~~
</pre>

### <span class="notranslate">Ruby</span>

~~~ ruby 
puts "Hello world!"
~~~

Source code:
<pre>
~~~ ruby 
puts "Hello world!"
~~~
</pre>

### <span class="notranslate">Go</span>

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

### <span class="notranslate">JavaScript</span>

~~~ javascript
console.log("Hello world!");
~~~

Source code:
<pre>
~~~ javascript
console.log("Hello world!");
~~~
</pre>

### <span class="notranslate">HTML</span>

~~~ html
<p>Hello world!</p>
~~~

Source code:

<pre>
~~~ html
&lt;p&gt;Hello world&lt;/p&gt;
~~~
</pre>

### <span class="notranslate">CSS</span>

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

## Text file

### Plain text 

~~~
"Hello World!"
~~~

Source code:
<pre>
~~~
"Hello World!"
~~~
</pre>


### JSON

~~~ json
{"message": "Hello World!"}
~~~

Source code:
<pre>
~~~ json
{"message": "Hello World!"}
~~~
</pre>

### YAML

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

### XML

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

### <span class="notranslate">INI</span>

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

# Mathematics Formula

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




