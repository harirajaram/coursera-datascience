---
title: "Run"
author: "Hari Rajaram"
date: "May 10, 2015"
output: html_document
---
Make sure to set the WD by stating setwd() and also have the respective txt file household_power_consumption.txt to parse.
loadAllRSources.R ---> Used to load all the project R sources at a go,so that the user can just run plot1(),plot2(),plot3(),plot4().
If the user wants to run separately,he/she can do separate load like source("plot1.R") and then run plot1().For the first run ,if the user hasnt't installed sqlDF then it will install the packages,don't worry about it.
