library(shiny)
library(mosaic)
library(lattice)
library(grid)
source("mSDGame.R", local=TRUE)

dist.col = rgb(1,0,0,1) #red
guess.col=rgb(0,0,1,1) #blue
actual.col = rgb(0,1,0,1) #green
trans.dist.col = rgb(1,0,0,.2)
trans.guess.col=rgb(0,0,1,.2)
trans.actual.col=rgb(0,1,0,.2)

iter=sample(1:100000, 1) #replace with manipulatorGetState
x=seq(-10,10, length=1000)
set.seed(iter)

shinyServer(
  
  function(input, output, session) {
    
    output$graph <- renderPlot({
      
      args <- list()
      args$guess.sd = input$sd
      args$myDist   = input$dist
      args$sol      = input$sol
      args$nxt      = input$nxt
        
      do.call(myFun, args)
    })
    
  }
)