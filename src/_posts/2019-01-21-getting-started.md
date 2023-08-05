---
title: "Getting started"
description: "How to write articles on this blog from an easy-to-use and rich syntax?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Methodology"
tags: ["Markdown"]
---

Discover the extension of the **Markdown syntax** used on this blog to write articles, or generate static pages, and more generally on the web. 
When you click on the button: <i class="far fa-file-code"></i> Source, you can see the **original source code of an article**. 
More precisely on this blog, a superset of Markdown is used and called [Kramdown](https://kramdown.gettalong.org/), the syntax is available [here](https://kramdown.gettalong.org/syntax.html) with a custom extension via the HTML paired tag `pre`. Each following section gives an overview and examples for each usage.
But before, what is exactly the Markdown?

[Markdown](https://daringfireball.net/projects/markdown/) is a lightweight and popular text metalanguage that is a writing standard
with the extension `.md` or `.markdown`. It is often converted into HTML which allows it to be easily shared on the web :spider_web:.

After the **conversion to HTML text**, it is decorated and animated by CSS style sheets and/or JS scripts: 

{% include article-google-drawing.html title="Markdown processor"
src="https://docs.google.com/drawings/d/e/2PACX-1vRPwfUjnj6bT9B-M4jdzQqOICzCwblxYR5xvgiXYWrpcgpmFddbWR-ErodWf-U0rE8f0aqzUfazXvf8/pub?w=960&amp;h=267" %}

Why using it Markdown? Because it is very handy to use for the reader and the writer:

* **Reader**: The generated HTML content got from the Markdown content is compatible with all web browsers that can render it for the final reader. 
* **Writer**: The Markdown content continues to be separated from the rendering. In addition, it is easy to learn and use syntax, with the pros of portability and compatibility, flexibility and customizability, and readability and maintainability. Modify its article, the content is more human-writable/readable and shorter than the HTML code, less expressive but sufficient for a blog post.

 See how to create your content with the right syntax through examples in the following sections. 

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

Let 2 trailing spaces have an end of the line, and let an empty line for a new paragraph:

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

Make a part, a subpart, and a sub-subpart:

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

Build an unordered list:

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

Use emoji, with [gemoji](https://github.com/github/gemoji) see [emoji cheat sheet](https://www.webfx.com/tools/emoji-cheat-sheet/).

For example: with shortcode :smile: :scream: :yum: or unicode directly 😀 😱 😋.

Source code for emoji with shortcode:
~~~ @escape
:smile: :scream: :yum:
~~~

Source code for emoji with unicode:
~~~ @escape
😀 😱 😋
~~~

## Links

It works with absolute and relative links:

* A simple link:

<https://www.google.com>

Source code:

~~~
<https://www.google.com>
~~~

* A link with a name: [Google](https://www.google.com).

Source code:
~~~
[Google](https://www.google.com)
~~~

* A link with a name and a title: [Google](https://www.google.com "Google's Homepage") with the title `Google's Homepage`.

Source code:
~~~
[Google](https://www.google.com "Google's Homepage")
~~~

You can use shortcuts for your links to use that several times on the article or to centralize links:

[Google1][1] [Google2][1]

[1]: https://www.google.com

Source code:
~~~
[Google1][1] [Google2][1]

[1]: https://www.google.com
~~~

## Notes

### Info

<pre class="info">
INFO
</pre>

Source code:
~~~
<pre class="info">
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

### Success

<pre class="success">
SUCCESS
</pre>

Source code:
~~~
<pre class="success">
SUCCESS
</pre>
~~~

## Comment

If you want to put a hidden text not displayed in the article but present in the written source, that is to say, a comment, simply do an HTML comment:

Source code:
~~~
<!-- comments -->
~~~

# Informatics code

## Programming language

The used syntax highlighter is Rouge, see the [list of supported languages and lexers](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers).

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

### <span class="notranslate">Scala</span>

~~~ scala 
println("Hello world!")
~~~

Source code:
<pre>
~~~ scala 
println("Hello world!")
~~~
</pre>

### <span class="notranslate">C# .NET</span>

~~~ csharp 
Console.WriteLine("Hello world!")
~~~

Source code:
<pre>
~~~ csharp 
Console.WriteLine("Hello world!")
~~~
</pre>

### <span class="notranslate">Rust</span>

~~~ rust
println!("Hello World!");
~~~

Source code:
<pre>
~~~ rust
println!("Hello World!");
~~~
</pre>

### <span class="notranslate">C++</span>

~~~ c++
std::cout << "Hello World!";
~~~

Source code:
<pre>
~~~ c++
std::cout << "Hello World!";
~~~
</pre>

### <span class="notranslate">C</span>

~~~ c
printf("Hello, World!");
~~~

Source code:
<pre>
~~~ c 
printf("Hello, World!");
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

### <span class="notranslate">TypeScript</span>

~~~ typescript
console.log("Hello world!");
~~~

Source code:
<pre>
~~~ typescript
console.log("Hello world!");
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

# Mathematics equation

Use LateX syntax, see [latex-project.org](https://www.latex-project.org).

:warning: The dollar symbol &#36; becomes a meta symbol, so there is a conflict with the dollar symbol use the HTML code `&#36;` to see the dollar symbol &#36;.

## In-line equation

This equation $\int_0^1 x^2dx = \frac{1}{3}$ is in-line.

Source code:
~~~
This equation $\int_0^1 x^2dx = \frac{1}{3}$ is in-line.
~~~

## Single-line equation

This equation is single-line and centered:

$$\int_0^1 x^2dx = \frac{1}{3}$$

Source code:
~~~
$$\int_0^1 x^2dx = \frac{1}{3}$$
~~~

## Multi-line equation

This equation is multi-line and centered:

$$
\displaylines{
\int_0^1 x\,dx = \frac{1}{2} \\
\int_0^1 x^2dx = \frac{1}{3}
}
$$

Source code:
~~~
$$
\displaylines{
\int_0^1 x\,dx = \frac{1}{2} \\
\int_0^1 x^2dx = \frac{1}{3} 
}
$$
~~~




