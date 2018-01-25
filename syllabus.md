---
title: NLU Syllabus
active_tab: syllabus
---

This syllabus is still being revised, so topics of future lectures are subject to change.

There will be around fifteen lectures, and a few feedforward sessions for
the coursework and exams.

<div class="alert alert-info">
Students enrolled in the course can access lecture recordings through 
<a href="learn.ed.ac.uk">learn</a> using the "Media Hopper Replay" link in 
the left sidebar.
</div>

<table class="table table-striped"> 
  <thead>
    <tr>
      <th>Week</th>
      <th>Day</th>
      <th>Plan</th>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <th>Week</th>
      <th>Day</th>
      <th>Plan</th>
    </tr>
  </tfoot>
  <tbody>
    {% for week in site.data.syllabus %}
    <tr>
      <td rowspan="{{ week.plan.size }}">{{ week.name }}</td>
      {% for day in week.plan %}
        {% unless forloop.first == true %}
          </tr>
          <tr>
        {% endunless %}
        <td>{{ day.date | date: "%b %d" }}</td>
        <td>
          {% for header in day.header %}
            {% if header.type == "coursework" %}<span class="label label-danger">Coursework</span>{% endif %}
            {{ header.title }}<br/>
            {% if header.video %}<a href="{{ header.video }}"><span class="label label-success">Video</span></a>{% endif %}
            {% if header.slides %}<a href="{{ header.slides }}"><span class="label label-primary">Slides</span></a>{% endif %}
            {% if header.notes %}<a href="{{ header.notes }}"><span class="label label-info">4up slides</span></a>{% endif %}
            {% if header.oldslides %}<a href="{{ header.oldslides }}"><span class="label label-default">2017 slides</span></a>{% endif %}
          {% endfor %}
          {% if day.items %}
          <ul>
            {% for item in day.items %}
              <li>
              {% if item.url %}<a href="{{ item.url }}">{% endif %}
                {{ item.description }}
              {% if item.url %}</a>{% endif %}
              </li>
            {% endfor %}
          </ul>
          {% endif %}
        </td>
      {% endfor %}
    </tr>
    {% endfor %}
  </tbody>
</table>

