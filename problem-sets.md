---
layout: page
title: Problem Sets
permalink: /problem-sets/
---

While I encourage you to discuss problem sets with your peers, you must submit your
own answers and not simple rewordings of another's work. Furthermore, **all
collaborations must be explicitly acknowledged at the top of your submissions**.





<br>

***

<br>

  

## Problem Set 05

* Assigned Fri 10/14
* Due Fri 10/21 11am


#### Learning Goals

* 


#### Homework

* Install the following packages
    + 
* Download this file to your computer and upload it to your `problem_sets` folder on RStudio Server: <a href="{{ site.baseurl }}/assets/PS/PS-05.Rmd" target="_blank">`PS-05.Rmd`</a>





<br>

***

<br>

  

## Problem Set 04

* Assigned Sat 10/8
* Due Fri 10/14 11am


#### Learning Goals

* This problem set assumes you are now further comfortable with the R, RStudio, 
and R Markdown workflow, and thus the complexity of the questions asked is
increased.
* Using more of the 5NG tools for data visualization to answer meaningful
questions using real data.
* Slowly introducting notions of data manipulation/wrangling.
* Putting statistical and data sciences in a greater social context via Hans 
Rosling's 20 minute TED Talk on <a target="_blank" class="page-link"
href="https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen?language=en#t-801073">The
best stats you've ever seen</a> (**bold** title, I know) on international
development data.


#### Homework

* As described in Lec03, install the following packages
    + The `okcupiddata` package containing the `profiles` data set: profile information for ~60K San Francisco OkCupid users in June 2012
    + The `gapminder` package containing the `gapminder` data set: international development data 
* Download this file to your computer: <a href="{{ site.baseurl }}/assets/PS/PS-04.Rmd" target="_blank">`PS-04.Rmd`</a>
* Upload it to RStudio server into the `problem_sets` folder:
    + In the Files panel, navigate to your `problem_sets` folder
    + Then click "Upload"
    
    
    
    

<br>

***

<br>




  

## Problem Set 03

* Assigned Fri 9/30
* Due Fri 10/7 11am
* <a href = "{{ site.baseurl }}/assets/PS/PS-03_discussion.html" target = "_blank">PS-03 Discussion</a>




#### Learning Goals

* Ramping up the use of the `ggplot2` package for data visualization
* Exploring real **time series** data
* Using Google as a research tool




#### Homework

* As described in Lec03, before tackling the problem set, install the following packages
    + The `Quandl` package for making it amazingly easy to get financial and economic data from [quandl.com](https://www.quandl.com/)
    + The `lubridate` package with consistent and memorable syntax that makes working with dates easier
* Download this file to your computer: <a href="{{ site.baseurl }}/assets/PS/PS-03.Rmd" target="_blank">`PS-03.Rmd`</a>
* Upload it to RStudio server into the `problem_sets` folder:
    + In the Files panel, navigate to your `problem_sets` folder
    + Then click "Upload"


<br>

***

<br>





## Problem Set 02

* Assigned Fri 9/23
* Due Fri 9/30 11am
* <a href = "{{ site.baseurl }}/assets/PS/PS-02_discussion.html" target = "_blank">Discussion)</a>

#### Learning Goals

* Taking your first baby steps using the `ggplot2` package for data visualization: an R-based
implementation of the "Grammar of Graphics"


#### Homework

* In RStudio, on the top right of the screen, next to the cube with "R" on it, if it says
    + `problem_sets`: click on it and select "Close Project"
    + `Project: (None)`: do nothing
* Download this file to your computer: <a href="{{ site.baseurl }}/assets/PS/PS-02.Rmd" target="_blank">`PS-02.Rmd`</a>
* Upload it to RStudio server into the `problem_sets` folder
* Open it and work on it from there
* Don't forget to answer the questions in the "Please Indicate" section





<br>

***

<br>





## Problem Set 01

* Assigned Fri 9/16
* Due Fri 9/23

#### Learning Goals

* This week's problem set doesn't involve much content, but rather is about
familiarizing yourselves with the problem set workflow and submission format using R
Markdown.
* In particular, we'll go over how to share your analyses over the web with a couple of clicks of the mouse!
* You'll start
    + seeing what I mean by "computers are stupid"
    + develop the skill of "debugging": identifying and removing errors from
    code. In our case, if your R Markdown file won't knit AKA load AKA compile 
    AKA render, follow the steps in [R Markdown 
    debugging](https://docs.google.com/document/d/1P7IyZ4On9OlrCOhygFxjC7XhQqyw8OludwChz-uFd_o/edit?usp=sharing)
    (also posted on the Resources page). This usually solves about 85% of
    problems; if you're still stuck after going through the steps, speak to your
    peers or me.
* In my experience, there are always a few hiccups with R Markdown at the
beginning, but by the third assignment everyone is on board.

#### Homework

* Download this file to your computer, then upload it to the RStudio Server as described in Lec03: <a href="{{ site.baseurl }}/assets/PS/PS-01.Rmd" target="_blank">`PS-01.Rmd`</a>
* ~~Submit your homework using this [submission form](https://docs.google.com/forms/d/1n1HNo17MA21-DQ_boklchwCjfr6_qx7GrLY5ot7796g/edit)~~. See below.





<br>

***

<br>





## Problem Set Submission Process

Using <a target="_blank" class="page-link"
href="https://support.rstudio.com/hc/en-us/articles/211659737-Sharing-Projects-in-RStudio-Server-Pro">RStudio
Server project sharing</a> (which you'll also be using for your group projects)! The grader and I will go over and leave comments directly on your problem set files.

**Only do this once:**

You will create a project (i.e. an organizational folder) that you will share
with me and the grader:

* In the top right of RStudio Server click on the cube with "R" in it -> New Project... -> Click "save" when prompted
* New Directory -> Empty Project -> Enter `problem_sets` as the Directory name and click "Create Project"
* On the top right it should say `problem_sets` next to the cube with "R" in it. Click on that -> Share Project...
* In the box with the blinking cursor add `aykim` and `tsingh`
* Copy the Project URL and press OK
* Paste your URL in the appropriate row in this <a target="_blank" class="page-link"
href="https://docs.google.com/spreadsheets/d/18alOq3kFV58LepI-UZ1swl9qPWHoa0VfHnLm3S5ldXg/edit#gid=1771999784">Google Sheet</a>

**Only for problem set 1:**

Move the file `PS-01.Rmd` to the `problem_sets` shared project folder so the grader and I can access it:

* In the Files panel -> Click on the house icon
* Click the checkboxes next to `PS-01.Rmd` and `PS-01.html`
* Click the gear icon "More" -> Move...
* Select `problem_sets`

**For all future problem sets:**

* When uploading the relevant `PS-XX.Rmd` file to RStudio Server, upload it directly to the `problem_sets` folder.


