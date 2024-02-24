---
pinned: true
title: "Getting started"
description: "How to write articles on this blog from an easy-to-use and rich syntax?"
authors: [ "glegoux" ]
time_reading_minutes: 10
category: "Methodology"
tags: [ "Markdown", "Liquid Template", "Kramdown Converter", "Jekyll" ]
---

Discover the **extended Markdown syntax** used on this tech blog, generated from the template [🧪 Jekyll Tech blog](https://github.com/glegoux/jekyll-tech-blog), to write articles or to generate static web pages. It is based on [Kramdown syntax](https://kramdown.gettalong.org/syntax.html) with [GFM parser](https://kramdown.gettalong.org/parser/gfm.html) and a light
custom extension for rendering. Besides, this article is written with this syntax. At the top of the web page, click on
<b><i class="far fa-file-code"></i> Source</b> to explore its source code and on <b><i class="fas fa-list-ul"></i> Table of contents</b> to browse
the supported features. So, you can mix this syntax with **existing macro** and **native HTML syntaxes** to write any content. As this blog is **highly configurable**, you can **build** your **custom macros**. Each article
also has **metadata** to inject constants of configurations.

<details open="true">
  <summary title="Click to expand and collapse the content"><b>Summary of supported features by the extended Markdown syntax</b></summary>
  <p markdown="1">
    Read the documentation of the [Kramdown syntax](https://kramdown.gettalong.org/syntax.html).
    All contents, even if unavailable with the extended Markdown syntax, can be shown thanks to embedded native content: HTML, JS, CSS, or macros: `includes` and `tags` of the [Liquid template](https://shopify.github.io/liquid).
  </p>
  <div>
      <table class="text-center">
        <thead >
          <tr>
            <th>Feature name</th>
            <th>Comment</th>
            <th>Extended Markdown syntax</th>
            <th>Existing Macro syntax</th>
            <th>Native HTML syntax</th>
          </tr>
        </thead>
        <tbody>
          <tr style="background-color: lightgrey">
            <td colspan="5"><b><a href="#structure">Structure</a></b></td>
          </tr>  
          <tr>
            <td><a href="#heading">Heading</a></td>
            <td>Organize your content with part, subpart, sub-subpart, etc.</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#new-line--paragraph">New line & Paragraph</a></td>
            <td>Organize the content in a part</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#horizontal-rule">Horizontal Rule</a></td>
            <td>Break between paragraph-level elements</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#note">Note</a></td>
            <td>Soon refactored! Add your notes: info, question, warning, error, success, etc.</td>
            <td>❌</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr style="background-color: lightgrey">
            <td colspan="5"><b><a href="#textual-content">Textual Content</a></b></td>
          </tr> 
          <tr>
            <td><a href="#enchanced-text">Enchanced Text</a></td>
            <td>Enhance your text: italics, bold, strikethrough, inline code, highlight, superscript, subscript, etc.</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#link">Link</a></td>
            <td>Use absolute and relative links named or not and re-usable</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#emoticon">Emoticon</a></td>
            <td>Use emoticons with shortcode or unicode</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#list">List</a></td>
            <td>Build an ordered, unordered, definition or task lists and sublists</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#table">Table</a></td>
            <td>Arrange the content in rows and columns with an optional header.</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#blockquote">Blockquote</a></td>
            <td>Format a special sentence of paragraph to draw attention to the reader</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#quote">Quote</a></td>
            <td>Soon refactored! Quote your authors</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#footnote">Footnote</a></td>
            <td>Put extra information at the bottom of the article referencing inside content</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#abbreviation">Abbreviation</a></td>
            <td>Shorten used word or concept by keeping the accessible meaning</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr style="background-color: lightgrey">
            <td colspan="5"><b><a href="#illustration-content">Illustration Content</a></b></td>
          </tr>
          <tr>
            <td><a href="#image">Image</a></td>
            <td>Soon documented!</td>
            <td>✅</td>
            <td>✅</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#video">Video</a></td>
            <td>Soon documented!</td>
            <td>❌</td>
            <td>✅</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#presentation">Presentation</a></td>
            <td>Soon documented!</td>
            <td>❌</td>
            <td>✅</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#diagram">Diagram</a></td>
            <td>Soon documented!</td>
            <td>❌</td>
            <td>✅</td>
            <td>✅</td>
          </tr>
          <tr style="background-color: lightgrey">
            <td colspan="5"><b><a href="#informatics-code">Informatics Code</a></b></td>
          </tr> 
          <tr>
            <td><a href="#programming-language">Programming Language</a></td>
            <td>Highlight code: python, java, scala, rust, c#, c++, c, bash, ruby, go, typescript, javascript, html, css ...</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#terminal">Terminal</a></td>
            <td>Highlight content in a terminal</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#text-file">Text File</a></td>
            <td>Highlight text content: plain, json, yaml, xml, ini ...</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr style="background-color: lightgrey">
            <td colspan="5"><b><a href="#mathematics-equation">Mathematics Equation</a></b></td>
          </tr> 
          <tr>
            <td><a href="#in-line-equation">In-Line Equation</a></td>
            <td>Use LateX syntax for in-line equation</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#single-line-equation">Single-Line Equation</a></td>
            <td>Use LateX syntax for single-line equation</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#multi-lines-equation">Multi-lines Equation</a></td>
            <td>Use LateX syntax for multi-lines equation</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr style="background-color: lightgrey">
            <td colspan="5"><b><a href="#special-content">Special Content</a></b></td>
          </tr>
          <tr>
            <td><a href="#html">HTML</a></td>
            <td>Put native HTML when the Markdown syntax is not available, it can contain Markdown in its markups</td>
            <td>❌</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#comment">Comment</a></td>
            <td>Comment content</td>
            <td>❌</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
          <tr>
            <td><a href="#escape">Escape</a></td>
            <td>Escape meta or special characters</td>
            <td>✅</td>
            <td>❌</td>
            <td>✅</td>
          </tr>  
          <tr>
            <td><a href="#others">Others</a></td>
            <td>Create your macros, extend the project or the tools everything is open-source</td>
            <td>❌</td>
            <td>❌</td>
            <td>✅</td>
          </tr>
        </tbody>
      </table>
  </div>
</details>

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

Why use an extended Markdown syntax? Markdown has a basic syntax, that is limited
for more advanced use cases (like tables, code blocks, syntax highlighting, footnotes and so one...). This extension
is **Markdown compatible**, so all articles written in Markdown can be used directly in this blog without breaking
changes, and **largely used** by an **active community**.

How it works? The files having the Markdown extension `.md` or `.markdown` are processed to HTML with this [processing workflow](https://jekyllrb.com/tutorials/orderofinterpretation/):

{% include content/google-drawing.html
title="Extended Markdown to HTML"
src="https://docs.google.com/drawings/d/e/2PACX-1vRPwfUjnj6bT9B-M4jdzQqOICzCwblxYR5xvgiXYWrpcgpmFddbWR-ErodWf-U0rE8f0aqzUfazXvf8/pub?w=960&amp;h=267"
%}

The following sections give examples for each usage to create your content with the right syntax.

# Structure

## Heading

Make a part, a subpart, and a sub-subpart.

It is used for each section here.

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

## New line & Paragraph

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

## Horizontal rule

To create a horizontal rule, use three or more asterisks `***`, dashes `---`, or underscores `___` on a line by themselves:

---

Source code:

~~~
---
~~~


## Note

Add your notes: info, question, warning, error, and success etc.

<div class="info">
INFO
</div>

Source code:

~~~
<div class="info">
INFO
</div>
~~~

<div class="question">
QUESTION
</div>

Source code:

~~~
<div class="question">
QUESTION
</div>
~~~

<div class="warning">
WARNING
</div>

Source code:

~~~
<div class="warning">
WARNING
</div>
~~~

<div class="error">
ERROR
</div>

Source code:

~~~
<div class="error">
ERROR
</div>
~~~

<div class="success">
SUCCESS
</div>

Source code:

~~~
<div class="success">
SUCCESS
</div>
~~~

# Textual Content

## Enchanced Text

Enhance your text:

- Italics: *italics* or _italics_  
- Bold:    **bold** or __bold__  
- Strikethrough: ~~strikethrough~~  
- Bold & Italics: **_bold italics_** or __*bold italics*__  
- Inline code: `code`
- Highlight: <mark>highlight</mark>
- Supscript: sup<sup>sup</sup>
- Subscript: sub<sub>sub</sub>

Source code:

~~~
- Italics: *italics* or _italics_  
- Bold:	**bold** or __bold__ 
- Strikethrough: ~~strikethrough~~
- Bold & Italics: **_bold italics_** or __*bold italics*__
- Inline code: `code`
- Highlight: <mark>highlight</mark>
- Supscript: sup<sup>sup</sup>
- Subscript: sub<sub>sub</sub>
~~~

## Link

It works with absolute and relative links:

**Simple Link**

<https://www.glegoux.com>

Source code:

~~~
<https://www.glegoux.com>
~~~

**Named Link** 

[glegoux](https://www.glegoux.com)

Source code:

~~~
[glegoux](https://www.glegoux.com)
~~~

with a title:

[glegoux1](https://www.glegoux.com "glegoux's Homepage") (with the
  title `glegoux's Homepage`)

Source code:

~~~
[glegoux](https://www.glegoux.com "glegoux's Homepage")
~~~

**Reference-style Link**

You can use shortcuts for your links to use that several times on the article or to centralize links:

[glegoux1][1] [glegoux2][1]

[1]: https://www.glegoux.com "glegoux's Homepage"

Source code:

~~~
[glegoux1][1] [glegoux2][1]

[1]: https://www.glegoux.com "glegoux's Homepage"
~~~

## Emoticon

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

## List

**Ordered List**

1. item
2. item
3. item

Source code:

~~~
1. item
2. item
3. item
~~~

<div class="info" markdown="1">
  Use `+`, `*` and `-` indifferently.
</div>

**Unordered List**

* item
  * subitem
  * ...
* item
  * subitem
  * ...
* item

Source code:

~~~
 * item
 * item
 * item
~~~

**Definition List**

item
: definition

item
: definition

Source code:

~~~
item
: definition

item
: definition
~~~

**Task List**

- [x] item
- [x] item
- [ ] item

Source code:

~~~
- [x] item
- [x] item
- [ ] item
~~~

## Table

TODO

## Blockquote

TODO

## Quote

Quote authors:

> Talk is cheap. Show me the code.

Linus Torvalds, creator of the Linux operating system

Source code:

~~~ @escape
> Talk is cheap. Show me the code.

Linus Torvalds, creator of the Linux operating system
~~~

## Footnote

Footnotes work mostly like reference-style links. A footnote is made of two things: a marker in the text that will become a superscript number; 
a footnote definition that will be placed in a list of footnotes at the end of the document. A footnote looks like this:

That's some text with a footnote[^1].

[^1]: And that's the footnote.

Source code:

~~~
That's some text with a footnote.[^1]

[^1]: And that's the footnote.
~~~

## Abbreviation

The HTML specification is maintained by the W3C.

*[HTML]: Hyper Text Markup Language

Source code:

~~~
The HTML specification is maintained by the W3C.

*[HTML]: Hyper Text Markup Language
~~~

# Illustration Content

## Image

TODO

## Video

TODO

## Presentation

TODO

## Diagram

TODO


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

~~~ r
print("Hello World!", quote = FALSE)
~~~

Source code:
<pre>
~~~ r
print("Hello World!", quote = FALSE)
~~~
</pre>

~~~ m
disp('Hello World!')
~~~

Source code:
<pre>
~~~ m
disp('Hello World!')
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

~~~ kotlin 
println("Hello world!")
~~~

Source code:
<pre>
~~~ kotlin 
println("Hello world!")
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
Console.WriteLine("Hello world!");
~~~

Source code:
<pre>
~~~ csharp 
Console.WriteLine("Hello world!");
~~~
</pre>

~~~ dart
print("Hello World!");
~~~

Source code:
<pre>
~~~ dart
print("Hello World!");
~~~
</pre>

~~~ swift
print("Hello World!")
~~~

Source code:
<pre>
~~~ swift
print("Hello World!")
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

~~~ php
print "Hello world!";
~~~

Source code:
<pre>
~~~ php
print "Hello world!";
~~~
</pre>

~~~ perl
print "Hello world!";
~~~

Source code:
<pre>
~~~ perl
print "Hello world!";
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

~~~ sql
CREATE TABLE helloworld;
~~~

Source code:
<pre>
~~~ sql
CREATE TABLE helloworld;
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
.hello .world {
  text-align: center
}
~~~

Source code:
<pre>
~~~ css
.hello .world {
  text-align: center
}
~~~
</pre>

~~~ sass
.hello {
  .world {
    text-align: center
  }
}
~~~

Source code:
<pre>
~~~ sass
.hello {
  .world {
    text-align: center
  }
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
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;message&gt;Hello World!&lt;/message&gt;
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

<div class="warning" markdown="1">
  The dollar symbol &#36; becomes a meta symbol, so there is a conflict
  with the dollar symbol use the HTML code `&#36;` to see the dollar symbol &#36;.
</div>

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

## Multi-lines Equation

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

# Special Content

## HTML

TODO

## Comment

If you want to put a hidden text not displayed in the article but present in the
written source, that is to say, a comment, simply do an HTML comment:

Source code:

~~~
<!-- comments -->
~~~

## Escape

<div class="info" markdown="1">
All described multi-lines escapes can work to escape inline and single line characters.
</div>

**Character by Character**

Use a backslash `\`, see the [list of all the characters that can be escaped](https://kramdown.gettalong.org/syntax.html#automatic-and-manual-escaping), or HTML entities like `&lt;` or `&gt;`.

**Inline and Single Line Characters**

Instead of using multiple backslashes, use for multiple characters inline and composing a single line, these syntaxes:

* <code>`inline or single line`</code> 

But you cannot display <code>`</code> inside a section delimited by <code>`</code>.

**Multi-lines Characters**

* <code>&lt;code&gt;inline or single line&lt;/code&gt;<code>

If you have to display reserved characters such as `<`, and `>` within the `<code>` section, the characters must be escaped using their respective HTML entity:
`<: &lt;`, and `>: &gt;`. But you cannot escape `&`.

* <code><pre>multi-lines</pre></code>

If you have to display reserved characters such as `<`,`>`, `&`, and `"` within the `<pre>` section, the characters must be escaped using their respective HTML entity:
`<: &lt;`, `>: &gt;`, `&: &amp;`, and `": &quot;`.

* <code>~~~ multi-lines ~~~</code>

But you cannot to display reserved sequence of characters `~~~` within a section delimited by `~~~`.

* <code>``` multi-lines ```</code>

But you cannot to display reserved sequence of characters <code>```</code> within a section delimited by <code>```</code>.

## Others

TODO
