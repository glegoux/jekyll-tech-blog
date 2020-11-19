---
title: "Java champion"
description: "How to become a Java champion?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Development"
tags: ["Language", "Java"]
---

Java champion is ambassador of Java ecosystem for the world! It is enough hard to become Java champion. 

Here qualities of Java champion: 

1. leader
2. technical luminary
3. independent-minded and credible
4. involved in Java technology
5. influencer

Currently in the world, there are 282 Java champions in 2019 knowing that in 2012 there are more that 10 millions of Java developers. That is to say about 1 per 30 thousands of Java developers. Here you can see repartition of Java champions in the world:

<figure>
    <div id="java-champions"></div>
    <figcaption>Java champions in the world (Source: https://github.com/aalmiray/java-champions)</figcaption>
</figure>

You can write to Java champions:

[javachampions@groups.io](mailto://javachampions@groups.io )

**References**

* [Find a Java Champion](https://apex.oracle.com/champions)
* [Who are Java Champions?](https://developer.oracle.com/javachampions)


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
jQuery(document).ready(function () {
    google.charts.load('current', {
        'packages':['geochart'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
    });
    google.charts.setOnLoadCallback(drawRegionsMap);
    
    function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
            ['Country', 'Number'],
            ['Armenia',1],
            ['Australia',1],
            ['Australia/USA',1],
            ['Austria',3],
            ['Belgium',5],
            ['Brazil',14],
            ['Bulgaria',2],
            ['Canada',4],
            ['China',2],
            ['Colombia',2],
            ['Denmark',2],
            ['Ecuador',1],
            ['Egypt',2],
            ['Estonia',2],
            ['France',12],
            ['Germany',25],
            ['Germany/Switzerland',1],
            ['Greece',3],
            ['Guatemala',2],
            ['Hungary',2],
            ['India',3],
            ['Indonesia',1],
            ['Ireland',1],
            ['Italy',7],
            ['Japan',5],
            ['Malaysia',1],
            ['Mexico',2],
            ['Mexico/Switzerland',2],
            ['Morocco',1],
            ['New Zealand',1],
            ['Norway',4],
            ['Perú',1],
            ['Poland',4],
            ['Portugal',1],
            ['Romania',2],
            ['Russia',4],
            ['Scotland',2],
            ['Serbia',1],
            ['Slovenia',1],
            ['South Africa',1],
            ['South Korea',1],
            ['Spain',4],
            ['Sweden',5],
            ['Switzerland',3],
            ['Netherlands',8],
            ['Turkey',5],
            ['United States',77],
            ['USA/Germany',1],
            ['United Kingdom',23]
        ]);
    
        var options = {
            colorAxis: {colors: ['#e6f7ff', '#00334d']},
            width: $('#content').width(), // responsive
            legend: false
        };
        
        var chart = new google.visualization.GeoChart(document.getElementById('java-champions'));
        
         chart.draw(data, options);
    }
    
    // responsive
    var width = $(window).width();
    $(window).resize(function(){
        if ($(this).width() != width) {
            width = $(this).width();
            drawRegionsMap();
        }
    });
});
</script>
