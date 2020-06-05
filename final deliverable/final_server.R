# Server

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(readr)
library(snakecase)
time_americans_sleep <- read_csv("Time_Americans_Spend_Sleeping.csv")

### Function to make first boxplot
boxplot1 <- function(df, age_group) {
  box_sleep1 <- df %>%
    filter(`Age Group` == age_group)

  ### first boxplot
  plot1 <- ggplot(box_sleep1, mapping = aes(
    x = box_sleep1$`Type of Days`,
    y = box_sleep1$`Avg hrs per day sleeping`,
    fill = box_sleep1$`Type of Days`
  )) +
    labs(title = "Average Hours of Sleep in Each Type of Days") +
    theme(plot.title = element_text(
      hjust = 0.5, size = 15,
      face = "bold"
    )) +
    xlab("Type of Days") +
    ylab("Average hours of sleep") +
    geom_boxplot(alpha = 0.7) +
    stat_summary(fun.y = "mean", geom = "point", shape = 20, size = 5,
                 color = "red", fill = "red") +
    theme(legend.position = "none") +
    scale_fill_brewer(palette = "Set1")
  ggplotly(plot1)
}

### Function to make second histogram
boxplot2 <- function(df, sex_choice) {
  box_sleep2 <- df %>%
    filter(Sex == sex_choice)

  ### second histogram
  plot2 <- ggplot(box_sleep2, mapping = aes(
    x = box_sleep2$`Age Group`,
    y = box_sleep2$`Avg hrs per day sleeping`,
    fill = box_sleep2$`Age Group`
  )) +
    labs(title = "Average Hours of Sleep in Each Age Group") +
    theme(plot.title = element_text(
      hjust = 0.5, size = 15,
      face = "bold"
    )) +
    xlab("Age Group") +
    ylab("Average hours of sleep") +
    geom_boxplot(alpha = 0.7) +
    stat_summary(fun.y = "mean", geom = "point", shape = 20, size = 5,
                 color = "red", fill = "red") +
    theme(legend.position = "none") +
    scale_fill_brewer(palette = "Set1")
  ggplotly(plot2)
}

### Creating the scatterplot

### Changes the X input of the scatterplot
x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = list("Year" = "Year",
                 "Period" = "Period",
                 "Avg hrs per day sleeping" = "'Avg hrs per day sleeping'",
                 "Type of Days" = "'Type of Days'",
                 "Age Group" = "'Age Group'",
                 "Activity" = "'Activity'",
                 "Sex" = "Sex"),
  selected = "Year"
)

### Changes the Y input of the scatterplot
y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = list("Year" = "Year",
                 "Period" = "Period",
                 "Avg hrs per day sleeping" = "'Avg hrs per day sleeping'",
                 "Type of Days" = "'Type of Days'",
                 "Age Group" = "'Age Group'",
                 "Activity" = "'Activity'",
                 "Sex" = "Sex"),
  selected = "Sex"
)

### Changes the color input of the dot in the plot
color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "Blue" = "blue", "Green" = "green")
)

### Changes the size input of the dot in the plot
size_input <- sliderInput(
  "size",
  label = "Size of point", min = 1, max = 10, value = 5
)

### Server
server <- function(input, output) {

  ### Renders first histogram
  output$plot1 <- renderPlotly({
    return(boxplot1(time_americans_sleep, input$Age))
  })

  ### Renders second histogram
  output$plot2 <- renderPlotly({
    return(boxplot2(time_americans_sleep, input$Sex))
  })

  ### Renders scatterplot
  output$scatter <- renderPlotly({
    title <- paste0("Time Americans Spend Sleeping Dataset Exploration: ",
                    input$x_var, " v.s.", input$y_var)

    ### Drawing scatterplot
    p <- ggplot(time_americans_sleep) +
      geom_point(
        mapping = aes_string(x = input$x_var, y = input$y_var),
        size = input$size,
        color = input$color) +
      labs(x = input$x_var, y = input$y_var, title = title)
    return(p)
  })
}
