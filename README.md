# glegoux.com

I use [GitHub Pages](https://pages.github.com/) with Jekyll to render this website available at https://glegoux.com .

### Technical stack

This source code generates static web pages, that are served by a static web server.

- Web static werver: GitHub.com
- Static site generator: Jekyll - https://jekyllrb.com with plugins: 
  - https://pages.github.com/versions
- Templating language: Liquid - https://shopify.github.io/liquid
- Text-to-HTML conversion: Markdown - https://daringfireball.net/projects/markdown
- CSS extension: Sass - https://sass-lang.com
- JavaScript library: JQuery - https://jquery.com
- JavaScript for mathematics: Mathjax - https://www.mathjax.org
- Toolkit for HTML, CSS and JS: Bootstrap - https://getbootstrap.com
- Data-interchange format: JSON - http://www.json.org and YAML - https://yaml.org

### Monitoring

- Health Checker: http://status.glegoux.com
- TLS/SSL Certificate Checker: https://www.digicert.com/help

### Known issues

- The url https://www.glegoux.com has an invalid TLS/SSL certificate, using wildcard certificate is undadvised and there is a GitHub open issue https://github.com/isaacs/github/issues/1675 
- The contents of iframe are not translated (see /contact/email page)
- The iframes are not resized when completing a web form for example (see /contact/email page)

### References

- https://help.github.com/categories/customizing-github-pages
- https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll
