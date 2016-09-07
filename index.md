---
layout: default
---

# Lecture/Topic List

In reverse chronological order:


## 1. Tools

### b) RStudio
<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %-d" %}
    {% assign current_year = post.date | date: "%Y" %}
    {% assign current_month = post.date | date: "%m" %}
    {% assign current_day = post.date | date: "%-d" %}
    {% if current_year == "2016" and current_month == "09" %}
    <li>
      {{ post.date | date: "%a %b %-d, %Y" }}: <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
    {% endif %}
  {% endfor %}
</ul> 



### a) R

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %-d" %}
    {% assign current_year = post.date | date: "%Y" %}
    {% assign current_month = post.date | date: "%m" %}
    {% assign current_day = post.date | date: "%-d" %}
    {% if current_year == "2016" and current_month == "08" %}
    <li>
      {{ post.date | date: "%a %b %-d, %Y" }}: <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
    {% endif %}
  {% endfor %}
</ul>  



