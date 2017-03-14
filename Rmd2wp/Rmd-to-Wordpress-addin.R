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

setwd('/home/chiara/Quantide/quantide/int/webSite/articles/dev/MF-Rmd2Wp')

library(RWordPress)
library(knitr)

options(WordpressLogin = c(datalamppost = 'rlabtest'),
        WordpressURL = 'http://www.datalamppost.altervista.org/xmlrpc.php')

knit2wp('Rmd-to-Wordpress-addin.Rmd', 
        title = 'Rmd to WordPress test1',
        action = "newPost",
        publish = F)

knit2wp('Rmd-to-Wordpress-addin.Rmd', 
        title = 'Rmd to WordPress Addin',
        action = "editPost",
        postid = 538,
        publish = F)

uploadFile("figure/speed-1.png")


getAnywhere(knit2wp)
