#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calculate Your BMR (Basal Metabolic Rate)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("Gender", 
                  label = "Your Gender",
                  choices = c("Male",  "Female")),
      numericInput("Age","What is your Age in years",value=30,min=18,max=100),
     
       numericInput("Weight","What is your Weight",value=30,min=30),
      selectInput("Weight_unit", 
                  label = "Unit of your weight",
                  choices = c("Kg",  "lbs")),
      
      numericInput("Hight","What is your hieght",value=45,min=45),
      selectInput("Hight_unit", 
                  label = "Unit of your hight",
                  choices = c("cm.",  "inch")),
      numericInput("Fat_P","What is your body fat percentage",value=15,min=1),
      
    
      
      checkboxInput("showModel1", "Do you want to see the calculation", value = TRUE) 
      
     
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
    
      h3("Your weight in KG"),
      textOutput("WeightValue"),
      h3("Your Lean Mass in KG"),
      textOutput("LeanM"),
      textOutput("LeanM_cal"),
      h3("Your hight in cm"),
      textOutput("HightValue"),
      
      h3("Your BMR is"),
      textOutput("Calc_Val"),
      textOutput("Calc")
      
    
      
    )
  )
))
