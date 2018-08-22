#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
      # Bring the unit of Weight and Height in KG and cm.
  Weight_value = reactive({
      if(input$Weight_unit == "lbs"){
          input$Weight * 0.453592
      } else{
      input$Weight * 1
      }
  })
  
  Hight_value = reactive({
      if(input$Hight_unit == "inch"){
        input$Hight * 2.54
      } else{
       input$Hight * 1
      }
  })
  
    output$WeightValue <- renderText({Weight_value()})
    output$HightValue <- renderText({Hight_value()})
   
    
    
    
    Lean_mass = reactive({Weight_value() - (Weight_value()*input$Fat_P/100)})
    output$LeanM <- renderText({Lean_mass()})
    
    
    BMR_value = reactive({
      if (input$Gender == "Female"){
        655 + (9.6 * Lean_mass()) + (1.8 * Hight_value()) - (4.7 * input$Age)
      } else {
        66 + (13.7 * Lean_mass()) + (5 * Hight_value()) - (6.8 * input$Age)
      }
      
    })
  
    output$Calc_Val <- renderText({BMR_value()})
    
    
    output$LeanM_cal <- renderText({
       if(input$showModel1) {"Your Lean Mass = Total Body Weight - (Body Fat % x Total Body Weight)."}
      else {""}
    })
    
    output$Calc<-renderText({
      if (input$showModel1){
        if (input$Gender == "Female"){"Women BMR Calculation = 655 + (9.6 x Your Lean Mass) + (1.8 x Height) - (4.7 x Age)"}
        else {"Men BMR Calculation = 66+(13.7 x Your Lean Mass) + (5 x Height) - (6.8 x Age)"}
        }
      
      
    })
  })
  

