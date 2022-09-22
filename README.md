
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BUSI4428

<!-- badges: start -->
<!-- badges: end -->

The goal of BUSI4428 is to simplify access to packages needed for
moduole BUSI4428 and also to provide some useful functions.

## Installation

You can install the development version of BUSI4428 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("liztwb/BUSI4428")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(BUSI4428)
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
HS_aw(rnorm(1000))
#>    VaR95     ES95 
#> 1644.400 2010.819
```
