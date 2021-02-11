#
# PAINEL DINÂMICO - server.R
#

server = function(input, output) { 
  
  output$texto1 =  renderUI({ 
    
    qtd_linhas <- length(unique(df$CODIGO_IBGE))
    qtd_municipios <- length(unique(df$CODIGO_IBGE))
    mediana <- median(df$VALOR)
    media <- mean(df$VALOR)
    desvio_padrao <- sd(df$VALOR)
    minimo <- min(df$VALOR)
    maximo <- max(df$VALOR)
    summary(df$VALOR)
    q_primeiro <- quantile(df$VALOR)[2]
    q_terceiro <- quantile(df$VALOR)[4]
    
    l_linhas <- paste("<tr><td width='50%' align='right'>Quantidade linhas:</td><td width='50%'>&nbsp;&nbsp;&nbsp;", format_numero(qtd_linhas),"</td></tr>")
    l_municipios <- paste("<tr><td align='right'>Quantidade Muncípios:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(qtd_municipios),"</td></tr>")
    l_mediana <- paste("<tr><td align='right'>Mediana:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(mediana),"</td></tr>")
    l_media <- paste("<tr><td align='right'>Média:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(media),"</td></tr>")
    l_desvio_padrao <- paste("<tr><td align='right'>Desvio Padrão:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(desvio_padrao),"</td></tr>")
    l_minimo <- paste("<tr><td align='right'>Valor Mínimo:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(minimo),"</td></tr>")
    l_maximo <- paste("<tr><td align='right'>Valor Mínimo:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(maximo),"</td></tr>")
    l_q_primeiro <- paste("<tr><td align='right'>Primeiro Quantil:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(q_primeiro),"</td></tr>")
    l_q_terceiro <- paste("<tr><td align='right'>Terceiro Quantil:</td><td>&nbsp;&nbsp;&nbsp;", format_numero(q_terceiro),"</td></tr>")
  
    
    l_final <- paste("<table width='100%'>",
                     l_linhas, 
                     l_municipios, 
                     l_mediana,
                     l_media,
                     l_desvio_padrao,
                     l_minimo,
                     l_maximo,
                     l_q_primeiro,
                     l_q_terceiro,
                     "</table><p>&nbsp;</p>")
    
    
    HTML(l_final)
    
  })
  
  output$texto2 =  renderUI({ 
    "texto 2"
  })
  
  output$texto3 =  renderUI({ 
    "texto 3"
  })
  
  
  output$titulo_estatistica_basica =  renderUI({ 
    
    HTML("<div style='text-align:center'><h1>Estatística Básica</h1></div>")
         
  })
  
  output$graficoBoxPlot1 = renderPlotly({
    
    fig <- plot_ly(y = df$VALOR, type = "box")
    
    fig
    
  })
  
  output$graficoBoxPlot1 = renderPlotly({
    
    
    
    
    fig <- plot_ly(y = df$VALOR, type = "box")
    fig <- fig %>% layout(title = 'Boxplot - com OutLiers')
    fig
    
  })
  
  output$graficoBoxPlot2 = renderPlotly({
    
    fig <- plot_ly(y = df_sem_outliers, type = "box")
    fig <- fig %>% layout(title = 'Boxplot - sem OutLiers')
    fig
    
  })
  
  
  
  
}