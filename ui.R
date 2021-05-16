#
# PAINEL DINÂMICO - ui.R
#

ui <- dashboardPagePlus(
  
  skin = "blue",
  title = "Painel Dinâmico v0.1",
  
  dashboardHeaderPlus(
    
    title = "Painel Din?mico 0.1"
    
  ),
  
  dashboardSidebar(
    
    sidebarMenu(id="sbmenu",
                
                menuItem(tabName = "arquivo", text = "Arquivo", icon = icon("file-alt")),
                menuItem(tabName = "tab1", text = "Estatísticas Básicas - V1", icon = icon("calculator")),
                menuItem(tabName = "tab2", text = "Estatísticas Básicas - V2", icon = icon("calculator")),
                menuItem(tabName = "tab3", text = "Estatísticas Básicas - CAT", icon = icon("calculator")),
                menuItem(tabName = "tab4", text = "V1 x V2 x CAT", icon = icon("calculator")))
    
  ),
  
  dashboardBody(
    
    tabItems(
      
      tabItem(
        
        tabName = "arquivo",
        htmlOutput("texto_orientacao_arquivo"),
        textInput("url","url para upload de dados: ex.: <http://aplicacoes.mds.gov.br/sagi/servicos/misocial???df=fl.alias=codigo_ibge:cod&fl=codigo_ibge,regiao,qtd_familias_beneficiarias_bolsa_familia_i,valor_repassado_bolsa_familia&fq=anomes_s:201901&fq=tipo_s:mes_mu&indent=on&q=*:*&wt=csv&rows=10000>"),
        actionButton("getDataButton", "Obter Dados"),
        dataTableOutput("dados")
        
      ),
      
      
      tabItem(
        
        tabName = "tab1",
        
        # ESTATÍSTICA BÁSICA
        column(12,
               
               htmlOutput("titulo_estatistica_basica_v1")
               
        ),
        
        # ESTATÍSTICA BÁSICA
        column(2,
               
               wellPanel(textOutput("qtd_linhas_v1"), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        
        column(2,
               
               wellPanel((textOutput("qtd_municipios_unicos_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("mediana_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("media_simples_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("desvio_padrao_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("minimo_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("maximo_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("q2_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("q4_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("media_geometrica_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("soma_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("moda_v1")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        
        # BOXPLOT 1
        column(12,
               
               plotlyOutput("graficoBoxPlot1_v1")
               
        )
        
      ),
      
      tabItem(
        
        tabName = "tab2",
        
        # ESTATÍSTICA BÁSICA
        column(12,
               
               htmlOutput("titulo_estatistica_basica_v2")
               
        ),
        
        # ESTATÍSTICA BÁSICA
        column(2,
               
               wellPanel(textOutput("qtd_linhas_v2"), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        
        column(2,
               
               wellPanel((textOutput("qtd_municipios_unicos_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("mediana_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("media_simples_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("desvio_padrao_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("minimo_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("maximo_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("q2_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("q4_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("media_geometrica_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("soma_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        column(2,
               
               wellPanel((textOutput("moda_v2")), style = "background: #00BFFF; color:white; height:100px")
               
        ),
        
        # BOXPLOT 1
        column(12,
               
               plotlyOutput("graficoBoxPlot1_v2")
               
        )
        
      ),
      tabItem(
        
        tabName = "tab3",
        
        column(12,
               
               wellPanel(textOutput("qtd_cat"), style = "background: #00BFFF; color:white; height:100px")
               
        )
        ,
        column(6,
               
               plotlyOutput("gra_cat_1")
               
        ),
        column(6,
               
               plotlyOutput("gra_cat_2")
               
        )
        
      ),
      tabItem(
        
        tabName = "tab4",
        
        column(12,
               
               wellPanel("V1, V2, CAT", style = "background: #00BFFF; color:white; height:100px")
               
        ),
        
        column(12,
               
               plotlyOutput("gra_dispersao_1")
               
        )
        
      )
      
    )
    
  )
  
)
