## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- echo = FALSE, results='asis'---------------------------------------
BiocStyle::markdown()
BiocStyle::markdown(css.files = c('custom.css'))

## ---- eval=FALSE---------------------------------------------------------
#  install.packages( "Rcpp" )

## ---- eval=FALSE---------------------------------------------------------
#  vignette('Rcpp-introduction')
#  vignette('Rcpp-FAQ')

## ----eval=FALSE----------------------------------------------------------
#  ## try http:// if https:// URLs are not supported
#  source("https://bioconductor.org/biocLite.R")
#  biocLite("Numero")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages( "<download_dir>/Numero_1.0.tar.gz", type="source", repos=NULL )

## ----setUpLibrary, eval=FALSE, include=FALSE-----------------------------
#  library(Numero)

## ----showReadme, eval = TRUE, echo=FALSE, comment=''---------------------
#read in README file
readmeFile <- system.file("extdata", "README.txt", package = "Numero")
myText <- readLines(readmeFile)

#only show the relevant portion of the README file, if it fails show all
myMin <- max(which(myText == 'Baseline data:'),0)
myMax <- min(which(myText == 'Missing values are shown as \'NaN\'.'),length(myText))
myText <- myText[myMin:myMax]

#display results
cat(myText, sep = '\n')

## ----setUpExample, eval=TRUE---------------------------------------------
exampleFile <- system.file("extdata", "finndiane_dataset.txt", package = "Numero")
db <- nroMatrix(exampleFile, keyvars = "INDEX")

## ----preprocess1, eval=TRUE----------------------------------------------
# Select training variables.
trvars <- c("uALB_log", "TG_log", "CHOL", "HDL2C", "CREAT_log")
trdata <- db[,trvars]

## ----preprocess2, eval=TRUE----------------------------------------------
# Separate men and women.
men <- which(!(db[,"MALE"] == 0))
women <- which(db[,"MALE"] == 0)

# Standardise training data to reduce gender differences
# and to eliminate differences in measurement units.
trdata[men,] <- scale.default(trdata[men,])
trdata[women,] <- scale.default(trdata[women,])
print(summary(trdata))

## ----setup1, eval=TRUE---------------------------------------------------
# Use K-means clustering to determine seed profiles for the SOM. 
km <- nroKmeans(x=trdata, k = 3)
sm <- nroKoho(seeds=km$centroids, radius = 3)

## ----setup2, eval=TRUE---------------------------------------------------
# Train the SOM with the standardized data.
sm <- nroTrain(som=sm, x=trdata)

