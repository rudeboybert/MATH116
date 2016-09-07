---
layout: default
---

# Fall 2016 Topic List

In reverse chronological order:


### 1. Introduction & Tools

<ul>
  {% for post in site.posts %}
    {% assign current_date = post.date | date: "%m %-d" %}
    {% assign current_year = post.date | date: "%Y" %}
    {% assign current_month = post.date | date: "%m" %}
    {% assign current_day = post.date | date: "%-d" %}
    {% if "09 01" < current_date and current_date <= "09 15" %}
    <li>
      {{ post.date | date: "%a %b %-d" }} -  
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>.
      {{ post.subtitle }}
    </li>
    {% endif %}
  {% endfor %}
</ul>  

