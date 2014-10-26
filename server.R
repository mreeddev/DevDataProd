library(shiny)
library(datasets)

data(Titanic)

d.t <- as.data.frame(Titanic)
t.glm <- glm(Survived ~ Class + Sex + Age, binomial, d.t, d.t$Freq)

p.t <- function(class, sex, age ){
  inputdata <- c(class, sex, age)
  p.d <- as.data.frame(t(inputdata))
  colnames(p.d) <- c("Class", "Sex", "Age")
  sp <- predict(t.glm,p.d , type = "response" )
  return(sp*100)
}

shinyServer(
  function(input, output) {
    output$prob <- renderText({p.t(input$c,input$s, input$a) })
    output$vict <- renderText({as.character( sum(d.t[d.t$Class==input$c & d.t$Sex==input$s & d.t$Age==input$a,5])) })

  })

