#
# PAINEL DINÂMICO - server.R
#

server = function(input, output) { 
  
  output$texto1 =  renderText({ 
    "texto 1"
  })
  
  output$texto2 =  renderText({ 
    "texto 2"
  })
  
  output$texto3 =  renderText({ 
    "texto 3"
  })
  
}