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
# OPÇÕES
#


options(scipen = 0)
        
#
# FUNÇÕES EXTRAS
#

remove_outliers <- function(x, na.rm = TRUE, ...) {
  
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
  
}

format_numero <- function(x) {
  
  format(x, big.mark=".", digits=2, )
  
}


#
# ARQUIVO TESTE
#

df <- read.csv("./dados_teste/df_pbf.csv")
df <- df[,c(1,5)]
names(df) <- c("CODIGO_IBGE", "VALOR")
df_sem_outliers <- remove_outliers(df$VALOR)

