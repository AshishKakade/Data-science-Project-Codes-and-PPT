# Q3) Emp_data -> Build a prediction model for Churn_out_rate
# this dataset is in Simple linear regression - Assignments
# using emp dataset log(X)
library(shiny)
ui <- fluidPage(
  titlePanel("Prediction of churn out rate"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num","Salary hike",1)
    ),
    mainPanel(
      tableOutput("distplot")
      
    )
  )
)
server <- function(input, output) {
  output$distplot <- renderTable({
    
    emp_data <- read.csv('file:///E:/EXCELR/Assignments/Simple_Linear_Regression_Assignment/emp_data.csv')
    
    
    reg_log <- lm(Churn_out_rate ~ log(Salary_hike) ,data=emp_data)
    nw=data.frame(Salary_hike =input$num)
    nw
    w=predict(reg_log,nw)
    w
  })
  
}

shinyApp(ui = ui, server = server)

# http://127.0.0.1:3898/