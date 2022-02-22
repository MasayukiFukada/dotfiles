#!/usr/bin/bash

curl https://holidays-jp.github.io/api/v1/date.csv | gawk -f holidays.awk > ~/.task/holidays.rc


