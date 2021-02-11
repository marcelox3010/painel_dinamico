#
# PAINEL DINÂMICO - ui.R
#

ui <- dashboardPagePlus(

  skin = "blue",
  title = "Painel Dinâmico v0.1",
  
  dashboardHeaderPlus(
    
    title = "Painel Dinâmico 0.1"
    
  ),
  
  dashboardSidebar(
    
    sidebarMenu(id="sbmenu",
                menuItem(tabName = "tab1", text = "Estatísticas Básicas", icon = icon("calculator")),
                menuItem(tabName = "tab2", text = "Gráficos", icon = icon("chart-bar")),
                menuItem(tabName = "tab3", text = "Mapa", icon = icon("globe-americas"))
    )
    
    
  ),
  
  dashboardBody(
    
    tabItems(

        tabItem(
        
          tabName = "tab1",
          
          # ESTATÍSTICA BÁSICA
          column(12,
                 
                 htmlOutput("titulo_estatistica_basica")
                 
          ),
          
          # ESTATÍSTICA BÁSICA
          column(12,
                 
            htmlOutput("texto1")
            
          ),
          
          # BOXPLOT 1
          column(6,
                 
                 plotlyOutput("graficoBoxPlot1")
                 
          ),
          
          # BOXPLOT 2
          column(6,
                 
                 plotlyOutput("graficoBoxPlot2")
                 
          ),
          
        
        ),
        
        tabItem(
        
          tabName = "tab2",
          htmlOutput("texto2")
        
        ),
        
        tabItem(
          
          tabName = "tab3",
          htmlOutput("texto3")
          
        )
      
    )
    
  )

)