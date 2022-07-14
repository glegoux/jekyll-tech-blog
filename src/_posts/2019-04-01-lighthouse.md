---
title: "Lighthouse"
description: "Lighthouse is an open-source, automated tool for improving the quality of web pages."
authors: ["glegoux"]
time_reading_minutes: 10
category: "Web"
---

[LightHouse](https://github.com/GoogleChrome/lighthouse) is an automated tool for improving the quality of web pages by auditing and analyzing your web pages and give you metrics and advices. You can run it against any web page, public or requiring authentication. It creates reports for performance, accessibility, progressive web apps, and more. It is an [open-source project](https://github.com/GoogleChrome/lighthouse) written in Javascript.

{% include article-image.html title="Logo of Lighthouse" src="lighthouse-logo.png" %}

You can run Lighthouse as a [Chrome Extension](https://chrome.google.com/webstore/detail/lighthouse/blipmdconlkpinefehnmjammfjpmpbjk?hl=en), from the command line, or as a [Node module](https://www.npmjs.com/package/lighthouse). You give Lighthouse a URL to audit, it runs a series of audits against the page, and then it generates a report on how well the page did. From there, use the failing audits as indicators on how to improve the page. Each audit has a reference doc explaining why the audit is important, as well as how to fix it.

# LightHouse reports

The reports are divided into 4 categories:

1. **Progressive Web App**: tests if your app is corect progressive web app. 
2. **Performance**: measures if the page is loaded quickly.
3. **Accessibility**: checks if the content of your page is accessible.
4. **Best Practices**: checks if good practices are applied.

The goal is to have a score of 100 for each category and for each web page of your website:

{% include article-image.html title="Lighthouse scores by report category" src="scores.png" %}

You can export report under HTML or JSON format, then import these format or see directly report due to [LightHouse Viewer](https://googlechrome.github.io/lighthouse/viewer/) (online version). You can install on-premises version directly from the [Git repository if LightHouse Viewer](https://github.com/GoogleChrome/lighthouse/tree/master/lighthouse-viewer) .

{% include article-image.html title="Export, import and view LightHouse report" src="export-import-view.jpg" %}

# LightHouse workflow and architecture

The workflow of LightHouse core is described by the following chart:

{% include article-image.html title="Architecture of Lighthouse Core" src="architecture.jpg" %}

[See details of the architecture](https://github.com/GoogleChrome/lighthouse/blob/master/docs/architecture.md).

The project [Lighthouse](https://github.com/GoogleChrome/lighthouse) has 5 main components:

1. **lighthouse-cli**: allows to call lighthouse services from command line.
2. **lighthouse-core**: allows to generate report to measure the quality of your app at some urls.
3. **lighthouse-extension**: allows to call lighthouse services from an Google Chrome extension.
4. **lighthouse-logger**: allows common logs.
5. **lighthouse-viewer**: allows to see report in your web browser or to import reports under JSON or HTML format.

# LightHouse installation

Before installing [LightHouse](https://github.com/GoogleChrome/lighthouse), we must have and check the versions of your tools:

- [Google Chrome](https://chromereleases.googleblog.com) : `google-chrome --version`
- [Node](https://github.com/nodejs/node) : `node --version`
- [NPM](https://github.com/npm/cli) : `npm --version`

For the recent versions of lighthouse, you can use [Canary](https://www.google.com/chrome/browser/canary.html) version for Google Chrome.

{% include article-image.html title="Google Chrome, Chromium and Canary version" src="chrome-version.jpg" %}

Reminder you in a nutshell that [Google Chrome](https://www.google.com/chrome/browser) is the [Chromium](https://github.com/chromium/chromium) open source project built, packaged, 
and distributed by Google. You can see a few [differences](https://chromium.googlesource.com/chromium/src/+/master/docs/chromium_browser_vs_google_chrome.md) . 
It has [4 versions](https://www.chromium.org/getting-involved/dev-channel) Stable, Beta, Dev, Canary for MAC, Windows and Linux for desktops and Android, iOS for smart phones and tablets.

# Example

For example, test LightHouse on this blog. Suppose that you have this file **urls.txt** containing one URL per line:

~~~
https://glegoux.com/
https://glegoux.com/blog/
https://glegoux.com/blog/articles/
https://glegoux.com/about/
https://glegoux.com/contact/
https://glegoux.com/contact/email/
~~~

Run this bash script to get one report by url:

~~~ bash 
i=0
for url in $(cat urls.txt); do
  echo -n "--"
  echo "$i ${url}" | tee -a matching_url_report.txt
  echo -n "--"
  lighthouse "${url}" --output=json --output-path="report-$i.json"
  $((i++))
done
~~~

Then run this python script **lighthouse.py**:

~~~ terminal
python3 lighthouse.py urls.txt reports.csv
~~~

[See code](https://github.com/glegoux/articles-glegoux-com/tree/master/articles/2019-04-01-lighthouse/code).

You get this csv file **reports.csv**. Visualize with **matplotlib** library:

 {% include article-image.html title=" Charts of scores for a set of URLs" src="plot_scores.png" %}

| url | date | pwa | performance | accessibility | best-practices |
| --- |  --- |  --- |  --- |  --- |  --- |
https://glegoux.com/projects/ | 2017-08-17 | 45.45 | 46.12 | 91.43  | 69.23
https://glegoux.com/blog/     | 2017-08-17 | 45.45 | 48.71 | 91.43  | 69.23
https://glegoux.com/home/     | 2017-08-17 | 36.36 | 36.53 | 88.57  | 69.23
https://glegoux.com/snippets/ | 2017-08-17 | 45.45 | 40.88 | 91.43  | 61.54
https://glegoux.com/articles/ | 2017-08-17 | 45.45 | 46.12 |  88.57 | 69.23
https://glegoux.com/about/    | 2017-08-17 | 36.36 | 40.18 |  88.57 | 69.23

# References

- [User Documentation](https://developers.google.com/web/tools/lighthouse)
- [LightHouse Open Source Code](https://github.com/GoogleChrome/lighthouse)
- [LightHouse as Google Chrome Extension](https://chrome.google.com/webstore/detail/lighthouse/blipmdconlkpinefehnmjammfjpmpbjk?hl=en)
- [LightHouse as NPM Javascript module](https://www.npmjs.com/package/lighthouse)
