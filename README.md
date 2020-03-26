# R package development
R package development from scratch in ~10 minutes. The following is an applied walk through to get you started with R package development. This is not a comprehensive description but it is self contained and will get you going.

A comprehensive description is available in this book:  
https://r-pkgs.org/

A github template for a new R package with development guidelines and continuous integration (CI)  
already set up can be found here:  
https://github.com/CTU-Basel/pkgTemplateR

# Dependencies
Lets get everything installed so this does not create speed bumps later on.
``` r
install.packages(c("devtools", "roxygen2", "testthat", "lintr", "rmarkdown"), dependencies = TRUE)
```

# Create package scaffold

``` r
library("devtools")
library("roxygen2")

create_package("CTUmethodsR")
```

# Check new package directory

``` bash
wrightp@box:~/CTUmethodsR> ls -lth
total 8.0K
-rw-r--r-- 1 wrightp wrightp  96 May  2 11:17 NAMESPACE
-rw-r--r-- 1 wrightp wrightp 354 May  2 11:17 DESCRIPTION
drwxr-xr-x 2 wrightp wrightp   6 May  2 11:17 man
drwxr-xr-x 2 wrightp wrightp   6 May  2 11:17 R
```

# Add first script
Save the below script in ~/CTUmethodsR/R as add_one.R
``` r
add_one <- function(x) {
    return(x+1)
}
```

``` bash
wrightp@box:~/CTUmethodsR/R> ls -lth
total 4.0K
-rw-r--r-- 1 wrightp wrightp 42 May  2 11:24 add_one.R
```

# Add documentation (roxygen2)
Writing documentation with roxygen2 may look cryptic at first glance. Once you have picked it up, however,
it is straight forward greatly simplifies the process.
```r
#' A function which adds 1 to a number
#'
#' This function allows you to add 1 to a number.
#' @param x The number you would like to add one to.
#' @keywords adding
#' @export
#' @examples
#' add_one(x = 14.1)
add_one <- function(x) {
    return(x+1)
}
```
# Process your documentation

```r
document("~/CTUmethodsR/")
```

# Install

```r
install("~/CTUmethodsR")
library("CTUmethodsR")
?add_one
```

# Linting (lintr)

Regular linting will ensure that the coding style in your package follows
predefined rules. This ensures consistency.

```r
library("lintr")
lint_package("~/CTUmethodsR/")
```
# Testing (testthat)
http://r-pkgs.had.co.nz/tests.html  
Using unit tests ensures longtime maintainability and robustness of your software.
Prevent building a house of cards and write tests while you develop your functions.
Every test you write into your command prompt can be a test you write into your test environment.

```r
setwd("~/CTUmethodsR/")
library("devtools")
use_testthat()
```

```bash
wrightp@box:~/CTUmethodsR> ls -lth
total 8.0K
drwxr-xr-x 3 wrightp wrightp  40 May  2 12:55 tests
-rw-r--r-- 1 wrightp wrightp 397 May  2 12:55 DESCRIPTION
drwxr-xr-x 2 wrightp wrightp  24 May  2 12:43 man
-rw-r--r-- 1 wrightp wrightp  62 May  2 12:43 NAMESPACE
drwxr-xr-x 2 wrightp wrightp  23 May  2 11:24 R
```

In tests/testthat create a file (test-add_one.R) to test your add one method. This filename must start
with "test".

```r
context("adding one")
 
test_that("Ones added as expected.", {
  expect_equal(add_one(1), 2)
  expect_equal(add_one(11.1), 12.1)
  expect_equal(add_one(1336), 1337)
})

test_that("Errored as expected.", {
  expect_error(add_one("Astring"))
})

```

```r
test("~/CTUmethodsR")
```

# Vignette
A vignette is an applied documentation of your package and can be very useful to help
users understand how your package works.

use_vignette will produce an example vignette which will give you a concrete starting point 
to work and edit in.

```r
setwd("~/CTUmethodsR/")
library("devtools")
use_vignette("CTUmethodsR-vignette")
```

``` bash
wrightp@box:~/CTUmethodsR> ls -lth
total 8.0K
drwxr-xr-x 3 wrightp wrightp 187 May  2 14:55 vignettes
-rw-r--r-- 1 wrightp wrightp 446 May  2 14:53 DESCRIPTION
drwxr-xr-x 3 wrightp wrightp  40 May  2 14:49 tests
drwxr-xr-x 2 wrightp wrightp  24 May  2 14:29 man
-rw-r--r-- 1 wrightp wrightp  62 May  2 14:29 NAMESPACE
drwxr-xr-x 2 wrightp wrightp  23 May  2 14:28 R
```

The code below will render your rmarkdown (Rmd) file to a pdf and html document.
```r
library("rmarkdown")
render("vignettes/ctumethodsr-vignette.Rmd", output_format=c("html_document", "pdf_document"))
```

``` bash
wrightp@box:~/CTUmethodsR> ls -lth vignettes/
total 1004K
drwxr-xr-x 2 wrightp wrightp    6 May  2 14:55 ctumethodsr-vignette_files
-rw-r--r-- 1 wrightp wrightp 232K May  2 14:55 ctumethodsr-vignette.pdf
-rw-r--r-- 1 wrightp wrightp 8.6K May  2 14:55 ctumethodsr-vignette.tex
-rw-r--r-- 1 wrightp wrightp 756K May  2 14:55 ctumethodsr-vignette.html
-rw-r--r-- 1 wrightp wrightp 2.1K May  2 14:53 ctumethodsr-vignette.Rmd
```

# DESCRIPTION
The DESCRIPTION file can be edited manually. You should enter a Title, the authorlist and think about
version number and release management.
http://r-pkgs.had.co.nz/description.html

# Further references
In part reproduced from and inspired by:  
https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
