# Page 2

## Libraries
library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

### Function to make first histogram
histogram1 <- function(df, age_group, bins) {
  hist_sleep1 <- df %>%
    select('Age Group', 'Avg hrs per day sleeping', 'Type of Days') %>%
    filter('Age Group' == age_group) %>%
    group_by('Type of Days') %>%
    mutate(
      Avg.hrs.per.type = summarise(
        mean(
          as.integer('Avg hrs per day sleeping')
        )
      )
    )
  
  plot1 <- ggplot(hist_sleep1, mapping = aes(x = Avg.hrs.per.type)) +
    labs(title = "Average Hours of Sleep in Each Type of Days") +
    theme(plot.title = element_text(
      hjust = 0.5, size = 15,
      face = "bold"
    )) +
    xlab("Type of Days") +
    ylab("Average hours of sleep") +
    geom_histogram(bins = bins, fill = "#b7dbdd", color = "white")
  ggplotly(plot1)
}

### Function to make second histogram
histogram2 <- function(df, sex_choice, bins) {
  hist_sleep2 <- df %>%
    select(Sex, 'Avg hrs per day sleeping', 'Age Group') %>%
    filter(Sex == sex_choice) %>%
    group_by('Age Group') %>%
    mutate(
      Avg.hrs.per.age = summarise(
        mean(
          as.integer('Avg hrs per day sleeping')
        )
      )
    )
  
  plot2 <- ggplot(hist_sleep2, mapping = aes(x = Avg.hrs.per.age)) +
    labs(title = "Average Hours of Sleep in Each Age Group") +
    theme(plot.title = element_text(
      hjust = 0.5, size = 15,
      face = "bold"
    )) +
    xlab("Age Group") +
    ylab("Average hours of sleep") +
    geom_histogram(bins = bins, fill = "#b7dbdd", color = "white")
  ggplotly(plot2)
}

## Shiny Server
server <- function(input, output) {
  
  ### Renders first histogram
  output$hist1 <- renderPlotly({
    return(histogram1(time_americans_sleep, input$'Age Group', input$bins))
  })
  
  ### Renders second histogram
  output$hist2 <- renderPlotly({
    return(histogram2(time_americans_sleep, input$Sex, input$bins))
  })
}


