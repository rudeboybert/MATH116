---
layout: post
title:  "Lec05 Grammar of Graphics"
subtitle: "Constructing statistical graphics in a 'grammatical' fashion and introducing the Five Named Graphs (5NG)."
date:   2016-09-21 10:10:45
categories: jekyll update
---



### Announcements

* I will post a Learning Check discussion under "After-Class Updates" before the next lecture.  
For example, the discussion for the Learning Checks from Lec04 are posted on that page.
* Refresher: What is tidy data?
  1. Each observation forms a row. i.e. each row corresponds to a single **observational unit**
  1. Each variable forms a column: 
      + Some of the variables may be used to identify the **observational units**. For organizational purposes, it's generally better to put these in the left-hand columns.
      + Some of the variables may be **values** associated with each observational unit.  
  1. Each type of observational unit forms a table.
  <img src="http://garrettgman.github.io/images/tidy-1.png" alt="Drawing" style="width: 800px;"/>
* Lec04 <a href = "{{ site.baseurl }}/assets/LC/tidy_data.html" target = "_blank">learning check discussion</a>.




So for example, in the stock

1. Each row corresponds to a single observational unit, in this case a given stock on a given date
1. Each variable forms a column
    + The `date` and `name` variables identify the observational units
    + The `price` variabale is a value associated with each observational unit
1. There is only one table to consider

1. Each row corresponds to a single observational unit, in this case a given hour on a give date (day, month, year) at a given airport (EWR, JFK, LGA)
1. Each variable forms a column
    + The ``, `` variables identify the observational units
    + There are 8 weather values associated with each observational unit
1. All these values are in their own table, separate from `flights`, `planes`, `airports`, which each consist of tables of their own observational units.






### In-Class

* <a href = "{{ site.baseurl }}/assets/2-Data/Grammar_of_Graphics.html" target = "_blank">Slides</a> on the "Grammar of Graphics" and the **5NG: the five named graphs**.
* Learning Check 1: For each of the 5NG examples in the above slides, following the example of Napoleon's march and the Grammar of Graphics
    1. identify the `data` variables being displayed and what type of variable they are
    1. identify the `aes()`thetic attribute of the `geom_`etric object the above `data` variables are being mapped to
* Learning Check 2: Answer the following questions:
    1. Scatterplot: Does spending more on a movie yield higher IMDB ratings?
    1. Linegraph: Why are there drops in the number of flights?
    1. Boxplot: Click <a target="_blank" class="page-link" href="http://www.datavizcatalogue.com/methods/images/anatomy/box_plot.png">here</a> for an explanation of boxplots. About what proportion of manual car models sold between 1984 and 2015 got 20 mpg or worse mileage?
    1. Barplot: About how many babies were named "Hayden" between 1990-2014?
    1. Histogram: What are the smallest and largest visible heights and what do you think of them? Also, think of one graph improvement to better convey information about SF OkCupid users.


### After-Class Updates

* Lec05 <a href = "{{ site.baseurl }}/assets/LC/5NG.html" target = "_blank">learning check discussion</a>.
