### Rmd to Wordpress


install.packages('devtools')

if (!require('RWordPress')) {
  devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
}


if(!require('knitr')){
  install.packages('knitr')  
}

help("RWordPress")


# START

library(RWordPress)
library(knitr)


path <- '/home/chiara/Github/r-lab1/Rmd2wp'
user <- datalamppost
pw <- 'blog*717741'
url <- 'http://www.datalamppost.altervista.org/xmlrpc.php'
file <- 'Rmd-to-Wordpress-addin.Rmd'
title <- 'Rmd to WordPress test3'
publish <- F

# rmd2wp <- function(path, )

  setwd(path)

options(WordpressLogin = c(datalamppost = ),
        WordpressURL = 'http://www.datalamppost.altervista.org/xmlrpc.php')

knit2wp('Rmd-to-Wordpress-addin.Rmd', 
        title = 'Rmd to WordPress test3',
        action = "newPost",
        publish = F)

list.files("figure")

figs <- c("figure/cars-3.png","figure/cars-4.png")

for(i in 1:length(figs)){
  tryCatch({
    uploadFile(figs[i])
    print(figs[i])
    Sys.sleep(5)    
  },
  error = function(e){})
}


------------------------------------------------------------


knit2wp('Rmd-to-Wordpress-addin.Rmd', 
        title = 'Rmd to WordPress Addin',
        action = "editPost",
        postid = 551,
        publish = F)


getAnywhere(knit2wp)
