library(shiny)
shinyUI(pageWithSidebar(
  
  headerPanel("What is the probability of surviving the sinking of the unsinkable Titanic?"),
  
  sidebarPanel(
    p("Select carriage, sex, and age:."),
    selectInput("c", label =h3("Carriage Class:"), list("1st Class Passenger" = "1st","2nd Class Passenger" = "2nd", "3rd Class Passenger" = "3rd", "Crew Member" = "Crew")),
    radioButtons("s", label = h3("Gender:"),
                 choices = list("Male" = "Male", "Female" = "Female"), 
                 selected = "Male"),
    radioButtons("a", label = h3("Age Group:"),
                 choices = list("Child" = "Child", "Adult" = "Adult"),
                 selected = "Child")),
  
  mainPanel(
    h3("Survival Probability (percent):"),
    h4(textOutput('prob')),
    h3("Total passengers in the selected set:"),
    h4(textOutput('vict')),
    
    p("This is a calculated probability of surviving the tragedy and may vary from actual facts.")
  
    )))
