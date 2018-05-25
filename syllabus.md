---
title: NLU Syllabus
active_tab: syllabus
---

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
            {% if header.type == "coursework" %}<span class="label label-danger">Coursework Due!</span>{% endif %}
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

