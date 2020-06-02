
# Libraries
library(ggplot2)
library("shiny")
library(readr)
time_americans_sleep <- read_csv("~/final-project-nyambik99/scripts/Time_Americans_Spend_Sleeping.csv")


# The purpose of this scatter plot is to explore the
# coorelattions between different values in the data set.


# Code for Scatter Plot (under app_ui.R)

select_values <- colnames(time_americans_sleep)
select_values

selected_values <- to_snake_case(select_values)
selected_values

x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = selected_values,
  selected = "year"
)


y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = selected_values,
  selected = "Sex"
)

color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "Blue" = "blue", "Green" = "green")
)

size_input <- sliderInput(
  "size",
  label = "Size of point", min = 1, max = 10, value = 5
)

ui <- fluidPage(
  h1("Time Americans Spend Sleeping Dataset Exploration"),
  x_input,
  y_input,
  color_input,
  size_input,
  plotOutput("scatter")
)


# server.R
library(dplyr)
library(shiny)
library(ggplot2)

server <- function(input, output) {
  output$scatter <- renderPlot({
    title <- paste0("Time Americans Spend Sleeping Dataset Exploration: ",
                    input$x_var, " v.s.", input$y_var)
    p <- ggplot(time_americans_sleep) +
      geom_point(
        mapping = aes_string(x = input$x_var, y = input$y_var),
        size = input$size,
        color = input$color) +
      labs(x = input$x_var, y = input$y_var, title = title)
    p
  })
}
