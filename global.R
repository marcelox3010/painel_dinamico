#
# PAINEL DINÂMICO - global.R
#

#
# FORMATO DO ARQUIVO
# CODIGO_IBGE;VALOR
#


#
# PACOTES NECESSÁRIOS
#

#install.packages("shiny")
#install.packages("dplyr")
#install.packages("plotly")
#install.packages("shinydashboard")
#install.packages("shinydashboardPlus")


#
# PACOTES
#

library("shiny")
library("dplyr")
library("plotly")
library("shinydashboard")
library("shinydashboardPlus")

#
# ARQUIVO TESTE
#

df_teste <- read.csv("./dados_teste/df_pbf.csv")
df_teste <- df_teste[,c(1,5)]
names(df_teste) <- c("CODIGO_IBGE", "VALOR")
