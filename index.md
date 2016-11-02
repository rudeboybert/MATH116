---
layout: default
---

<a target="_blank" class="page-link" href="https://github.com/{{ site.github_username }}{{ site.baseurl }}"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/365986a132ccd6a44c23a9169022c0b5c890c387/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f7265645f6161303030302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png"></a>

<img src="./assets/figure/pipeline.png" alt="Drawing" style="width: 700px;" border="1"/>

# Fall 2016 Topic List

In reverse chronological order (a more detailed outline can be found
[here](https://docs.google.com/spreadsheets/d/1qy21hHMbjYfv65IL5DwxID0nEltXgOD6h52hBVwWa_s/edit#gid=0)).

## 4. Regression

## 3. Statistical Inference

### a) Background

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% if "10 31" <= current_date and current_date <= "11 30" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% if "10 26" <= current_date and current_date <= "10 26" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul> 





## 2. Data

### d) Importing Data (Note Lec18 is here)

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% if "10 28" <= current_date and current_date <= "10 28" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul> 


### c) Manipulation/Wrangling

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% if "10 11" <= current_date and current_date <= "10 24" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul> 



### b) Visualization

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% if "09 20" <= current_date and current_date <= "10 10" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul>  



### a) Representation

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% assign current_year = post.date | date: "%Y" %}
    {% assign current_month = post.date | date: "%m" %}
    {% assign current_day = post.date | date: "%d" %}
    {% if "09 19" <= current_date and current_date <= "09 19" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul>  



## 1. Introduction & Tools

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %d" %}
    {% assign current_year = post.date | date: "%Y" %}
    {% assign current_month = post.date | date: "%m" %}
    {% assign current_day = post.date | date: "%d" %}
    {% if "09 12" <= current_date and current_date <= "09 16" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>:
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul>  

