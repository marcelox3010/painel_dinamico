#
# PAINEL DINâMICO - global.R
#

#
# FORMATO DO ARQUIVO
# CODIGO_IBGE;VALOR
#


#
# PACOTES NECESSÁRIOS
#

# install.packages("tidyverse")
# install.packages("DT")
# install.packages("shiny")
# install.packages("dplyr")
# install.packages("plotly")
# install.packages("shinydashboard")
# install.packages("shinydashboardPlus")
# install.packages("leaflet")
# install.packages("data.table")

#
# PACOTES
#

library("tidyverse")
library("DT")
library("shiny")
library("dplyr")
library("plotly")
library("shinydashboard")
library("shinydashboardPlus")
library("leaflet")
library("data.table")

#
# OP??ES
#


options(scipen = 0)

#
# FUNÇÕES EXTRAS
#

format_numero <- function(x) {
  
  format(x, big.mark=".", digits=2, )
  
}

gm_mean = function(x, na.rm=TRUE){
  exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))
}


getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}



