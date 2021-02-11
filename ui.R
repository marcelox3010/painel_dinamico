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
                menuItem(tabName = "tab1", text = "Estatísticas Básicas", icon = icon("funnel-dollar")),
                menuItem(tabName = "tab2", text = "Gráficos", icon = icon("funnel-dollar")),
                menuItem(tabName = "tab3", text = "Mapa", icon = icon("users"))
    )
    
    
  ),
  
  dashboardBody(
    
    tabItems(
      
      tabItem(
        
        tabName = "tab1",
        textOutput("texto1")
      
      ),
      
      tabItem(
        
        tabName = "tab2",
        textOutput("texto2")
        
      ),
      
      tabItem(
        
        tabName = "tab3",
        textOutput("texto3")
        
      )
      
    )
    
  )

)