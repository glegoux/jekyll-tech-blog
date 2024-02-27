// visualization
function buildValueChart(value, id) {
    let elementHTML = document.getElementById(id);
    elementHTML.innerText = value;
}

function buildDonutPieChart(result, id) {
    google.charts.load("current", {packages: ["corechart"]});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable(result);

        var options = {
            title: '',
            pieHole: 0.4,
            height: '100%',
            width: '100%',
            chartArea: {
                left: 0,
                width: '80%',
                height: '80%',
            },
            legend: {
                maxLines: 1,
                textStyle: {
                    fontSize: 12
                },
                position: 'right'
            }
        };

        var chart = new google.visualization.PieChart(document.getElementById(id));
        chart.draw(data, options);
    }
}

function buildBarChart(xTitle, yTitle, result, id) {
    google.charts.load('current', {'packages': ['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable(result);

        var options = {
            chart: {
                title: '',
            }, bars: 'vertical', legend: {
                position: 'none'
            }, hAxis: {
                title: xTitle
            }, vAxis: {
                title: yTitle
            }
        };

        var chart = new google.charts.Bar(document.getElementById(id));
        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
}

function sortTablePostsLog(n) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("table-log");
    switching = true;
    dir = "asc";
    var currentTh = document.querySelector("#table-log th:nth-child(" + (n + 1) + ")");
    document.querySelectorAll("#table-log th").forEach(th => {
        if (th !== currentTh) {
            th.removeAttribute("data-sort");
        }
    });
    if (currentTh.getAttribute("data-sort") === "asc") {
        currentTh.setAttribute("data-sort", "dsc");
    } else if (currentTh.getAttribute("data-sort") === "dsc" || currentTh.getAttribute("data-sort") === null) {
        currentTh.setAttribute("data-sort", "asc");
    }
    while (switching) {
        switching = false;
        rows = table.rows;
        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[n];
            y = rows[i + 1].getElementsByTagName("TD")[n];
            if (dir == "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            } else if (dir == "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount++;
        } else {
            if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }
}

// analytics
function countBy(values, fn) {
    return values
        .map(typeof fn === 'function' ? fn : val => val[fn])
        .reduce((acc, val) => {
            acc[val] = (acc[val] || 0) + 1;
            return acc;
        }, {});
}

function getNumberOfPosts(posts) {
    return posts.length;
}

function getTotalNumberOfReadingTime(posts) {
    let sum = 0;
    posts.forEach(post => {
        sum += post["time_reading_minutes"];
    });
    return sum;
}

function getStatsPostsByCategory(posts) {
    let countBlogPostsByCategory = countBy(posts, post => post.category);
    const result = [];
    for (const [key, value] of Object.entries(countBlogPostsByCategory)) {
        result.push([key, value]);
    }
    result.sort((x, y) => {
        if (x[0] < y[0]) {
            return -1;
        } else if (x[0] > y[0]) {
            return 1;
        } else {
            return 0;
        }
    });
    result.unshift(["Category", "Number of posts"])
    return result;
}

function getStatsPostsByYear(posts) {
    let countBlogPostsByYear = countBy(posts, post => post.year);
    const result = [];
    for (const [key, value] of Object.entries(countBlogPostsByYear)) {
        result.push([key, value]);
    }
    result.sort((x, y) => {
        if (x[0] < y[0]) {
            return -1;
        } else if (x[0] > y[0]) {
            return 1;
        } else {
            return 0;
        }
    });
    result.unshift(["Year", "Number of posts"])
    return result;
}

// data processing
const url = "/_stats.json";

fetch(url)
    .then((response) => {
        return response.json();
    })
    .then((data) => {
        buildValueChart(getNumberOfPosts(data), "total-n-posts");

        buildValueChart(getTotalNumberOfReadingTime(data), "total-reading-time");

        buildDonutPieChart(getStatsPostsByCategory(data), "posts-by-category");

        buildBarChart("Year", "Number of posts", getStatsPostsByYear(data), "posts-by-year");
    });
