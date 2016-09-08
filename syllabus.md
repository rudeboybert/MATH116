---
layout: page
title: Syllabus
permalink: /syllabus/
---

## MATH 116: Fall 2016

* **Instructor:** [Albert Y. Kim](http://community.middlebury.edu/~aykim/) - Assistant Professor of Statistics
* **Email:** [aykim@middlebury.edu](aykim@middlebury.edu)
    + I will respond to emails within 24h, but not during weekends.
    + Please only email me with administrative and briefer questions as I prefer addressing more substantive questions in person.
* **Class Location/Time:**
    + MWF 11:15–12:05 in Warner 506 and R 11:00-12:15 in Sunderland 202.
    + You do not need to inform me of absenses. Please consult your peers for what you missed.
* **Office Hours:** Warner 310 or the math lounge just outside. Feel free to come to the [MATH 216]({{ BASE_PATH }}/pages/teaching/courses/MATH216/2016-09.html) office hours as well, but those students get priority then. 
    + M 2:30-4:00 and W 1:00-2:30
    + MATH 216: M 1:00-2:30 and W 2:30-4:00
    + Or by appointment





## Course Description and Objectives

#### Description

A practical introduction to statistical methods and computational tools needed 
to make sense of data. This course is an evolution of many traditional
introductory statistics courses in that computing plays a more central role in
learning than mathematics and a higher emphasis is placed on ``thinking with
data.'' Topics include data visualization, data wrangling, confidence intervals,
hypothesis testing, and regression. The course has no formal mathematics or
computer science prerequisites, and is especially suited to students in the
physical, social, environmental, and life sciences who seek an applied
orientation to data analysis.

#### Objectives

* Replicate the data analysis research process as faithfully as possible at a
level [suitable for novices](http://arxiv.org/abs/1507.05346).
* Foster a conceptual understanding of statistical topics and methods with
[simulation/resampling](https://www.amstat.org/education/pdfs/ResamplingUndergradCurriculum.pdf) and data, rather than mathematical formulae.
* Blur the traditional lecture/lab dichotomy of introductory statistics courses 
by incorporating more [computational and algorithmic thinking](http://www.stat.berkeley.edu/~statcur/Preprints/ComputingCurric3.pdf).
* Introduce best practices for [reproducible
research](http://www.nature.com/news/reproducibility-1.17552) and collaboration.
* Develop [statistical
literacy](https://en.wikipedia.org/wiki/Statistical_literacy) by tying in the
curriculum to current events, demonstrating the importance statistics plays in 
society.

<!-- Prior to 2016-09

This is an introductory probability and statistics class where a conceptual understanding of the material will be stressed.  Goals of this course include:

* Expose students to statistical concepts, including sampling, data visualizations, confidence intervals, hypothesis tests, and regression.
* Give students experience manipulating and analyzing data using the R statistical software package.
* Introduce the theory underlying statistics, including probability, distributions, the central limit theorem, etc.
* Develop statistical literacy.
* Tie in the curriculum to current events, demonstrating the importance statistics plays in society.
-->





## Topics

Roughtly speaking, the course will cover the following topics (for a more
precise breakdown of topics, click
[here](https://docs.google.com/spreadsheets/d/1qy21hHMbjYfv65IL5DwxID0nEltXgOD6h52hBVwWa_s/edit#gid=0)):

1. Introduction and Tools (R, RStudio, and R Markdown)
1. Data:
    * Data formatting
    * Data visualization
    * Data manipulation/wrangling/munging
1. Statistical inference:
    * Background and terminology
    * Confidence intervals
    * Hypothesis testing
1. Regression:
    * Simple linear regression
    * Multiple regression
    * Logistic regression (time allowing)





## Materials

#### 1) Textbooks

* An Introduction to Statistical and Data Sciences by Kim and Ismay available   [online](https://rudeboybert.github.io/IntroStatDataSciences/).
* Intro Stat with Randomization and Simulation 1st edition by Diez, Barr, and
Cetinkaya-Rundel available
    + Online at the [OpenIntro
    webpage](https://www.openintro.org/stat/textbook.php?stat_book=isrs) in both
    standard and tablet friendly PDF formats.
    + In print at the Middlebury bookstore and 
    [Amazon](https://www.amazon.com/Introductory-Statistics-Randomization-Simulation-David/dp/1500576697).

#### 2) Computing and Software

* Instead of using the desktop version of the RStudio interface to R, we will be
using the cloud-based RStudio Server, which you can access in your browser via 
[go/rstudio](https://rstudio.middlebury.edu/). Note if you are off-campus you 
must first log into the [Middlebury 
VPN](http://mediawiki.middlebury.edu/wiki/LIS/Off-campus_Access).
* Just like your
[middfiles](http://www.middlebury.edu/offices/technology/help/technology/servers/middfiles)
file server, you can access the files on the RStudio file server by logging onto
[cifs://rstudio.middlebury.edu](cifs://rstudio.middlebury.edu)





## Evaluation

There are four components to your final grade: problem sets, engagement,
midterms, and the final project.

#### 1) Problem Sets 10%

Each problem is worth only a nominal portion of the final grade. As such, 
instead of viewing them as evaluative tools used by the instructor to assign 
grades, they should be viewed as low-stakes opportunities to develop flex one's 
statistics and data science muscles and receive feedback on the progress of 
one's learning.

While I encourage you to discuss homeworks with your peers, you must submit your
own answers and not simple rewordings of another's work. Furthermore, **all
collaborations must be explicitly acknowledged at the top of your submissions**.

* Assigned/due on Fridays.
* Lowest two scores dropped.
* No email submissions will be accepted; ask a classmate to print it for you.
* Unstapled homeworks and homeworks without names will not be accepted.
* No extensions.
* Late (defined as after lecture ending) submissions will be accepted up to 2
days after the due date at a 25% penalty per day. They might be returned late as well.

#### 2) Engagement 10%

It is difficult to explicity codify what constitutes "an engaged student," so 
instead I present the following rough principle I will follow: **you'll only get
out of this class as much as you put in**. Some examples of behavior counter to this
principle:

* Not participating in in-class exercises.
* Not coming to office hours when the situation warrants it. 
* Submitting homework that has code or content that is copied from (or only
slightly modified versions of) your peers' work, going against the philosophy of
the homeworks being opportunities for practice and feedback, rather than as items 
to be graded on.

#### 3) Three Midterms 45%

* Midterm dates: Wed 10/5 (in-class), Wed 10/26 7:30pm, and Wed 11/16 7:30pm.
* All midterms are cummulative and require a scientific calculator (no
smartphones).
* There is no extra-credit work to improve midterm scores after the fact.
* There will be no make-up nor rescheduled midterms, except in the following cases:
    + serious illness or death in the family only if documentation is provided.
    + athletic commitments or religious obligations only if documentation is
    provided and prior notice is given. In such cases, rescheduled exams must be
    taken **before** the rest of the class.

#### 4) Final Project 35%

Rather than a final exam, there will be a final capstone group project. This
is an opportunity for you to perform you own start-to-finish data analysis 
project incorporating the tools from this class. The project will center around you finding a dataset, performing an analysis
using the tools we have covered in this class, and writing a report.

* Due Sun 12/18 at noon.
* Groups of no more than three will be assigned by me.
* A system will be put in place to hold your group peers accountable for their work.
* Complete details will be given on Wed 11/2.





## Academic Accommodations for Disabilities

Students with documented disabilities who believe that they may need accommodations in this class are encouraged to contact me as early in the semester as possible to ensure that such accommodations are implemented in a timely fashion. Assistance is available to eligible students through Student Accessibility Services. Please contact Jodi Litchfield, the ADA coordinator, at [litchfie@middlebury.edu](litchfie@middlebury.edu) or 802.443.5936 for more information. All discussions will remain confidential.
