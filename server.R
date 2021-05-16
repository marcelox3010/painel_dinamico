#
# PAINEL DINÂMICO - server.R
#

server = function(input, output) { 
  
  #
  # TELA OBTER DADOS ARQUIVOS
  #
  
  output$texto_orientacao_arquivo = reactive({
    
    texto <- "<h1>Insira aqui o link do arquivo que quer apresentar<h1>"
    return(texto)
    
  })
  
  getFileData <- eventReactive(input$getDataButton, {
    
    myData <- read.csv(input$url)
    names(myData) <- c("cod_ibge", "cat", "var1", "var2")
    df <- myData
    #df_sem_outliers_v1 <- remove_outliers(df$var1)
    #df_sem_outliers_v2 <- remove_outliers(df$var2)
    df
    
  })
  
  output$dados <- renderDataTable({
    
    getFileData()
    
  })
  
  #
  # TELA - ESTATÍSTICAS BÁSICAS - V1
  #
  
  output$qtd_linhas_v1 = reactive({ 
    
    df <- getFileData()
    qtd_municipios <- format_numero(length(unique(df$cod_ibge)))
    return(paste("Qtd. de Linhas: ",qtd_municipios))
    
  })
  
  output$qtd_municipios_unicos_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(length(unique(df$cod_ibge)))
    return(paste("Qtd. de Municípios Únicos: ",qtd))
    
  })
  
  output$mediana_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(median(df$var1))
    return(paste("Mediana: ",qtd))
    
  })
  
  output$media_simples_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(mean(df$var1))
    return(paste("Média: ",qtd))
    
  })
  
  output$desvio_padrao_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(sd(df$var1))
    return(paste("Desvio Padrão: ",qtd))
    
  })
  
  output$minimo_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(sd(df$var1))
    return(paste("Mínimo: ",qtd))
    
  })
  
  output$maximo_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(max(df$var1))
    return(paste("Máximo: ",qtd))
    
  })
  
  output$q2_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(quantile(df$var1)[2])
    return(paste("Quantil 2: ",qtd))
    
  })
  
  output$q4_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(quantile(df$var1)[4])
    return(paste("Quantil 4: ",qtd))
    
  })
  
  output$media_geometrica_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(gm_mean(df$var1))
    return(paste("M?dia geométrica: ",qtd))
    
  })
  
  output$soma_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(sum(df$var1))
    return(paste("Soma: ",qtd))
    
  })
  
  output$moda_v1 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(getmode(df$var1))
    return(paste("Moda: ",qtd))
    
  })
  
  output$titulo_estatistica_basica_v1 =  renderUI({ 
    
    HTML("<div style='text-align:center'><h1>Estatística Básica - Vari?vel 1</h1></div>")
    
  })
  
  output$graficoBoxPlot1 = renderPlotly({
    
    df <- getFileData()
    fig <- plot_ly(y = df$var1, type = "box")
    
    fig
    
  })
  
  output$graficoBoxPlot1_v1 = renderPlotly({
    
    df <- getFileData()
    fig <- plot_ly(data=df, y = ~var1, type = "box")
    fig <- fig %>% layout(title = 'Boxplot - com OutLiers')
    fig
    
  })
  
  
  output$titulo_estatistica_basica_v2 =  renderUI({
    
    HTML("<div style='text-align:center'><h1>Estatística Básica - Variável 2</h1></div>")
    
  })
  
  #
  # TELA - ESTATÍSTICAS BÁSICAS - V2
  #
  
  output$qtd_linhas_v2 = reactive({ 
    
    df <- getFileData()
    qtd_municipios <- format_numero(length(unique(df$cod_ibge)))
    return(paste("Qtd. de Linhas: ",qtd_municipios))
    
  })
  
  output$qtd_municipios_unicos_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(length(unique(df$cod_ibge)))
    return(paste("Qtd. de Munic?pios ?nicos: ",qtd))
    
  })
  
  output$mediana_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(median(df$var2))
    return(paste("Mediana: ",qtd))
    
  })
  
  output$media_simples_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(mean(df$var2))
    return(paste("Média: ",qtd))
    
  })
  
  output$desvio_padrao_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(sd(df$var2))
    return(paste("Desvio Padrão: ",qtd))
    
  })
  
  output$minimo_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(sd(df$var2))
    return(paste("Mínimo: ",qtd))
    
  })
  
  output$maximo_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(max(df$var2))
    return(paste("Máximo: ",qtd))
    
  })
  
  output$q2_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(quantile(df$var2)[2])
    return(paste("Quantil 2: ",qtd))
    
  })
  
  output$q4_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(quantile(df$var2)[4])
    return(paste("Quantil 4: ",qtd))
    
  })
  
  output$media_geometrica_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(gm_mean(df$var2))
    return(paste("Média geométrica: ",qtd))
    
  })
  
  output$soma_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(sum(df$var2))
    return(paste("Soma: ",qtd))
    
  })
  
  output$moda_v2 = reactive({ 
    
    df <- getFileData()
    qtd <- format_numero(getmode(df$var2))
    return(paste("Moda: ",qtd))
    
  })
  
  output$titulo_estatistica_basica_v2 =  renderUI({ 
    
    HTML("<div style='text-align:center'><h1>Estatística Básica - Variável 2</h1></div>")
    
  })
  
  output$graficoBoxPlot1_v2 = renderPlotly({
    
    df <- getFileData()
    fig <- plot_ly(data=df, y = ~var2, type = "box")
    fig <- fig %>% layout(title = 'Boxplot - com OutLiers')
    fig
    
  })
  
  #
  # TELA - ESTAT?STICAS B?SICAS - CAT
  #
  
  output$qtd_cat = reactive({ 
    
    df <- getFileData()
    qtd_categorias <- length(unique(df$cat))
    paste("Qtd. Categorias", qtd_categorias)
    
    
  })
  
  
  output$gra_cat_1 = renderPlotly({
    
    df <- getFileData()
    fig <- plot_ly(data=df, labels = ~cat, values = ~var1, type = 'pie')
    fig <- fig %>% layout(title = 'CAT1 x VAR1')
    fig
    
  })
  
  output$gra_cat_2 = renderPlotly({
    
    df <- getFileData()
    fig <- plot_ly(data=df, labels = ~cat, values = ~var2, type = 'pie')
    fig <- fig %>% layout(title = 'CAT1 x VAR2')
    fig
    
  })
  
  output$gra_dispersao_1 = renderPlotly({
    
    df <- getFileData()
    fig <- plot_ly(data=df, x = ~var1, y = ~var2, color = ~cat)
    fig <- fig %>% layout(title = "VAR1 x VAR2")
    fig
    
  })
  
  
  
}
