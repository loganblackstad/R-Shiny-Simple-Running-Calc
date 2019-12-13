---
title: "README"
author: "loganblackstad"
date: "Friday, December 13, 2019"
output: html_document
---
## Introduction
This is the README file for the my first Shiny application. The application itself is a **simple running pace calculator**.  

The RStudio shiny application for this course project is [hosted on Rstudio's shiny server](https://loganblackstad.shinyapps.io/running-calc/) 

### Dependencies:
This application depends on the following libraries:  
* ```shiny``` - required for the shiny application  
* ```car``` - required for the ```recode()``` function used in the application  
  
### Developer usage:
To execute this application download the ```server.R``` and ```ui.R``` files from this repository and use ```runApp()``` to execute.  
To see the code in action, you can use:  
```runApp(displayMode = 'showcase')```  
  
  
### User documentation:
The documentation for the application user is included on the **Documentation** tab within the application.  