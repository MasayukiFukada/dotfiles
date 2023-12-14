#!/usr/bin/bash

curl https://holidays-jp.github.io/api/v1/date.csv | gawk -f holiday_parse.awk > holidays.rc

mv --interactive holidays.rc /home/minamo/.task/.

