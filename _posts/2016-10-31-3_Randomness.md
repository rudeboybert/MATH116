---
layout: post
title:  "Lec19 Intro to Probability via Simulation"
subtitle: "Tapping into R's random number generating capabilities."
date:   2016-10-31 10:10:45
categories: jekyll update
---



### Announcements

* Mac Chrome users annoyed with swipe gestures moving you "back" from RStudio
Server, there is a 
[fix](http://osxdaily.com/2015/05/09/disable-swipe-navigation-google-chrome-mac/) to disable it.
If you need help, let me know.


### In-Class

* <a href = "{{ site.baseurl }}/assets/3-Statistical_Inference/randomness.html" target = "_blank">Slides</a>: 
* In-class exercise: Go over the code below, then do the following learning checks:
    + LC1: Create a histogram of the number illustrating the long-run behavior of flipping a coin 10 times. 
        * Where is it centered?
        * Describe the shape of the **distribution** of values
    + LC2: Tie all elements of Line 13 of code below to the Attributes of Powerball seen in the slides above.
    + LC3: Try to replicate the above, but for the sum of two die rolls. Hint: `resample(c(1:6), 2)`

<script src="https://gist.github.com/rudeboybert/a20029fc7aa0e4af8e1687c12b278ae8.js"></script>
