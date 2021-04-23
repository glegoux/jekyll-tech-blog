---
title: "Getting Started"
description: "Markdown is a easy-to-use syntax for writing text on this blog."
authors: ["glegoux"]
time_reading_minutes: 10
category: "Methodology"
tags: ["Markdown"]
---

Discover the Markdown syntax used on this blog to write articles, or to generate static pages, and more generally on the web. 
When you click on the button: <i class="far fa-file-code"></i> Source, you can see the original source code of the article. 
More precisely on this blog, a superset of Markdown is used and called [Kramdown](https://kramdown.gettalong.org/), the syntax is available [here](https://kramdown.gettalong.org/syntax.html). Each following section gives an overview and examples for each usage.
But before, what is exactly the markdown?

[Markdown](https://daringfireball.net/projects/markdown/) is a lightweight and popular text metalanguage which is a writing standard for scientists 
with extension `.md` or `.markdown`. It is often converted into HTML what allows it to be easily shared on the web :spider_web:.

After the conversion to a HTML text, it is decorated and animated by CSS style sheets and/or JS scripts: 

{% include article-google-drawing.html title="Markdown processor"
src="https://docs.google.com/drawings/d/e/2PACX-1vRPwfUjnj6bT9B-M4jdzQqOICzCwblxYR5xvgiXYWrpcgpmFddbWR-ErodWf-U0rE8f0aqzUfazXvf8/pub?w=960&amp;h=267" %}

Why using it rather than HTML? Because it is more handy to use for the writer, and all advantages of the HTML are preserved for the:

* Reader: The generated HTML content is compatible with all web browsers, nothing change. 
* Writer: The structured Markdown content and the style continue being separated, you can modify the one without interfering with the another one.  But in addition, it is easier to create then modify its article, the content is more human-readable and shorter than the HTML.

With the 3 following sections: `Text`, `Informatics code` and `Mathematics formula`, see how to create your content with the right syntax through examples. 

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

Use emoji, with [gemoji](https://github.com/github/gemoji) see [emoji cheat sheet](https://www.webfx.com/tools/emoji-cheat-sheet/).

For example: :smile: :scream: :yum:

Source code:
~~~ @escape
:smile: :scream: :yum:
~~~

## Links

It works with absolute and relative link:

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

* A link with a name and a title: [Google](https://www.google.com "Google's Homepage") with title `Google's Homepage`.

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

If you want to put a hidden text not displayed in the article but present in the written source, that is to say a comment, simply do a HTML comment:

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

# Mathematics Formula

Use LateX syntax, see [latex-project.org](https://www.latex-project.org) .

## Inline formula

This formula $\int_0^1 x^2dx = \frac{1}{3}$ is inline.

Source code:
~~~
$\int_0^1 x^2dx = \frac{1}{3}$
~~~

:warning: It is a conflict with the dollar symbol, use the html code for that `&#36;`, that gives you &#36;.

## Multiline formula

This formula is multiline and centered:

$$
\displaylines{
\int_0^1 xdx = \frac{1}{2} \\
\int_0^1 x^2dx = \frac{1}{3}
}
$$

Source code:
~~~
$$
\displaylines{
\int_0^1 xdx = \frac{1}{2} \\
\int_0^1 x^2dx = \frac{1}{3} 
}
$$
~~~




