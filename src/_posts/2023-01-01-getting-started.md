---
title: "Getting started"
description: "How to write articles on this blog from an easy-to-use and rich syntax?"
authors: [ "glegoux" ]
time_reading_minutes: 10
category: "Methodology"
tags: [ "Markdown" ]
---

Discover the **extended Markdown syntax** used on this blog, generated from the template [🧪 Jekyll Tech blog](https://github.com/glegoux/jekyll-tech-blog),
to write articles or to generate static pages. It is based on [Kramdown syntax](https://kramdown.gettalong.org/syntax.html) with a light and
custom extension for rendering. Besides, this article is written with this syntax, at the top of the web page, click on
<b><i class="far fa-file-code"></i> Source</b> to explore its source code and on <b><i class="fas fa-list-ul"></i> Table of contents</b> to browse
the supported features.

<details>
  <summary><b>Summary of supported features by the extended Markdown syntax</b></summary>
  <p markdown="1">
    Read the documentation of the [Kramdown syntax](https://kramdown.gettalong.org/syntax.html).
    All contents, even if not available with the extended Markdown syntax, can be showed thanks to embedded HTML, JS, CSS,
    or includes and tags of the Liquid template.
  </p>
  <div>
      <table class="text-center">
        <thead>
          <tr>
            <th>Feature name</th>
            <th>Extended Markdown syntax</th>
            <th>Comment</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Abbreviation</td>
            <td>✅</td>
            <td>Soon available!</td>
          </tr>
          <tr>
            <td>Image</td>
            <td>✅</td>
            <td>Soon available!</td>
          </tr>
          <tr>
            <td>Video</td>
            <td>❌</td>
            <td>Soon available!</td>
          </tr>
          <tr>
            <td>Presentation</td>
            <td>❌</td>
            <td>Soon available!</td>
          </tr>
          <tr>
            <td>Diagram</td>
            <td>❌</td>
            <td>Soon available!</td>
          </tr>
          <tr>
            <td>HTML</td>
            <td>❌</td>
            <td>Soon available! Put native HTML when the Markdown syntax is not available</td>
          </tr>
          <tr>
            <td>Others</td>
            <td>❌</td>
            <td>Soon available!</td>
          </tr>
        </tbody>
      </table>
  </div>
</details>

# How it works?

What is the
[Markdown syntax](https://daringfireball.net/projects/markdown/)?
It is a lightweight and popular text metalanguage that is a writing standard. It is often converted into HTML,
allowing it to be easily shared on the web :spider_web:. After converting to
HTML, it is decorated and animated by CSS style sheets and/or JS scripts. See
more details on this [Markdown Guide](https://www.markdownguide.org).

Why use Markdown? Because it is very handy to use for the reader and the writer:

* **Reader**: The generated HTML content from the Markdown content is compatible
  with all web browsers that can render it for the final reader.
* **Writer**: The Markdown content continues to be separated from the rendering.
  In addition, it is easy to learn and use syntax, with the pros of portability
  and compatibility, flexibility and customizable, and readability and
  maintainability. Modify its article so the content is more
  human-writable/readable and shorter than the HTML code, less expressive, but
  sufficient for a blog post.

Why use the [Kramdown syntax](https://kramdown.gettalong.org/syntax.html)? Markdown has a basic syntax, that is limited
for more advanced use cases (like tables, code blocks, syntax highlighting, footnotes and so one...). This extension
is **Markdown compatible**, so all articles written in Markdown can be used directly in this blog without breaking
changes, and **largely used** by an **active community**.

The files with the Markdown extension `.md` or `.markdown` are processed to HTML:

{% include article/google-drawing.html
title="Extended Markdown to HTML"
src="https://docs.google.com/drawings/d/e/2PACX-1vRPwfUjnj6bT9B-M4jdzQqOICzCwblxYR5xvgiXYWrpcgpmFddbWR-ErodWf-U0rE8f0aqzUfazXvf8/pub?w=960&amp;h=267"
%}

The following sections give examples for each usage to create your content with the right syntax.

# Headings

Make a part, a subpart, and a sub-subpart.

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

# New line & Paragraph

Let 2 trailing spaces have an end of the line, and let an empty line for a new
paragraph:

Hello,

World!

Source code:

~~~ whitespace
Hello,␣␣\n
\n
World!\n
~~~

*Note: `\n` and `␣` represent respectively a new line character and a space
character.*

# Text Highlighting

Enhance your text:

Italics: *italics* or _italics_  
Bold:    **bold** or __bold__  
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

# List

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

# Quote

> Talk is cheap. Show me the code.

Linus Torvalds, creator of the Linux operating system

Source code:

~~~ @escape
> Talk is cheap. Show me the code.

Linus Torvalds, creator of the Linux operating system
~~~

# Emoticon

Use emoji, with [gemoji](https://github.com/github/gemoji)
see [emoji cheat sheet](https://www.webfx.com/tools/emoji-cheat-sheet/).

For example: with shortcode :smile: :scream: :yum: or unicode directly 😀 😱 😋.

Source code for emoji with shortcode:

~~~ @escape
:smile: :scream: :yum:
~~~

Source code for emoji with unicode:

~~~ @escape
😀 😱 😋
~~~

# Links

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

* A link with a name and a
  title: [Google](https://www.google.com "Google's Homepage") with the
  title `Google's Homepage`.

Source code:

~~~
[Google](https://www.google.com "Google's Homepage")
~~~

You can use shortcuts for your links to use that several times on the article or
to centralize links:

[Google1][1] [Google2][1]

[1]: https://www.google.com

Source code:

~~~
[Google1][1] [Google2][1]

[1]: https://www.google.com
~~~

# Notes

Add your notes: info, question, warning, error, and success etc.

<pre class="info">
INFO
</pre>

Source code:

~~~
<pre class="info">
INFO
</pre>
~~~

<pre class="question">
QUESTION
</pre>

Source code:

~~~
<pre class="question">
QUESTION
</pre>
~~~

<pre class="warning">
WARNING
</pre>

Source code:

~~~
<pre class="warning">
WARNING
</pre>
~~~

<pre class="error">
ERROR
</pre>

Source code:

~~~
<pre class="error">
ERROR
</pre>
~~~

<pre class="success">
SUCCESS
</pre>

Source code:

~~~
<pre class="success">
SUCCESS
</pre>
~~~

# Comment

If you want to put a hidden text not displayed in the article but present in the
written source, that is to say, a comment, simply do an HTML comment:

Source code:

~~~
<!-- comments -->
~~~

# Informatics Code

## Programming Language

The used syntax highlighter is Rouge, see
the [list of supported languages and lexers](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers),
with python, java, scala, rust, c#, c++, c, bash, ruby, go, typescript,
javascript, html, css etc.

~~~ python
print("Hello world!")
~~~

Source code:

<pre>
~~~ python
print("Hello world!")
~~~
</pre>

~~~ java 
System.out.println("Hello world!");
~~~

Source code:
<pre>
~~~ java 
System.out.println("Hello world!");
~~~
</pre>

~~~ scala 
println("Hello world!")
~~~

Source code:
<pre>
~~~ scala 
println("Hello world!")
~~~
</pre>

~~~ csharp 
Console.WriteLine("Hello world!")
~~~

Source code:
<pre>
~~~ csharp 
Console.WriteLine("Hello world!")
~~~
</pre>

~~~ rust
println!("Hello World!");
~~~

Source code:
<pre>
~~~ rust
println!("Hello World!");
~~~
</pre>

~~~ c++
std::cout << "Hello World!";
~~~

Source code:
<pre>
~~~ c++
std::cout << "Hello World!";
~~~
</pre>

~~~ c
printf("Hello, World!");
~~~

Source code:
<pre>
~~~ c 
printf("Hello, World!");
~~~
</pre>

~~~ bash
echo "Hello world!"
~~~

Source code:

<pre>
~~~ bash 
echo "Hello world!"
~~~
</pre>

~~~ ruby 
puts "Hello world!"
~~~

Source code:
<pre>
~~~ ruby 
puts "Hello world!"
~~~
</pre>

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

~~~ typescript
console.log("Hello world!");
~~~

Source code:
<pre>
~~~ typescript
console.log("Hello world!");
~~~
</pre>

~~~ javascript
console.log("Hello world!");
~~~

Source code:
<pre>
~~~ javascript
console.log("Hello world!");
~~~
</pre>

~~~ html
<p>Hello world!</p>
~~~

Source code:

<pre>
~~~ html
&lt;p&gt;Hello world&lt;/p&gt;
~~~
</pre>

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

Have a dark terminal container:

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

## Text File

Highlight your text file content: plain, json, yaml, xml, ini etc.

~~~
"Hello World!"
~~~

Source code:
<pre>
~~~
"Hello World!"
~~~
</pre>

~~~ json
{"message": "Hello World!"}
~~~

Source code:
<pre>
~~~ json
{"message": "Hello World!"}
~~~
</pre>

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

# Mathematics Equation

Use LateX syntax, see [latex-project.org](https://www.latex-project.org).

:warning: The dollar symbol &#36; becomes a meta symbol, so there is a conflict
with the dollar symbol use the HTML code `&#36;` to see the dollar symbol &#36;.

## In-line Equation

This equation $\int_0^1 x^2dx = \frac{1}{3}$ is in-line.

Source code:

~~~
This equation $\int_0^1 x^2dx = \frac{1}{3}$ is in-line.
~~~

## Single-line Equation

This equation is single-line and centered:

$$\int_0^1 x^2dx = \frac{1}{3}$$

Source code:

~~~
$$\int_0^1 x^2dx = \frac{1}{3}$$
~~~

## Multi-line Equation

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
