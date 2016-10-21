---
layout: post
title:  "Lec16 Finishing the 5MV"
subtitle: "Creating new variables by mutate() existing ones."
date:   2016-10-21 10:10:45
categories: jekyll update
---



### Announcements


* Lec14 <a href = "{{ site.baseurl }}/assets/LC/more_data_manipulation.html" target = "_blank">learning check discussion</a>
* Lec15 <a href = "{{ site.baseurl }}/assets/LC/more_data_manipulation_2.html" target = "_blank">learning check discussion</a>
* Difference between `filter()` and `summarize()`:
    + `filter()` merely selects rows without transformation any of the data:
    <img src="{{ site.baseurl }}/assets/figure/filter.png" alt="Drawing" style="width: 500px;"/>
    + `summarize()` collapses information from multiple rows/observations to create single rows:
    <img src="{{ site.baseurl }}/assets/figure/summarize1.png" alt="Drawing" style="width: 500px;"/>
    + If we first `group_by()` to impose a gropuing structure (grey, blue and green in second box) and then `summarize()`, this collapses information from multiple rows/observations to create single rows **on a group-by_group** basis:
     <img src="{{ site.baseurl }}/assets/figure/group.png" alt="Drawing" style="width: 500px;"/>
     <img src="{{ site.baseurl }}/assets/figure/group_summary.png" alt="Drawing" style="width: 500px;"/>
   
    







### In-Class

* <a href = "{{ site.baseurl }}/assets/2-Data/finishing_5MV.html" target = "_blank">Slides</a>: `arrange()` and `join`
* <a href = "https://rudeboybert.github.io/IntroStatDataSciences/5-manip.html#create-new-variableschange-old-variables-using-mutate" target = "_blank">Section 5.1.4</a> of textbook



### After-Class Updates

* Lec16 <a href = "{{ site.baseurl }}/assets/LC/finishing_data_manipulation.html" target = "_blank">learning check discussion</a>

