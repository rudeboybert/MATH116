---
layout: default
---

<img src="./assets/figure/pipeline.png" alt="Drawing" style="width: 700px;" border="1"/>

# Fall 2016 Topic List

In reverse chronological order (a more detailed outline can be found [here](https://docs.google.com/spreadsheets/d/1qy21hHMbjYfv65IL5DwxID0nEltXgOD6h52hBVwWa_s/edit#gid=0)):

## 4. Regression

## 3. Statistical Inference

## 2. Data

## 1. Introduction & Tools

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %-d" %}
    {% assign current_year = post.date | date: "%Y" %}
    {% assign current_month = post.date | date: "%m" %}
    {% assign current_day = post.date | date: "%-d" %}
    {% if "09 12" <= current_date and current_date <= "09 13" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>.
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul>  

