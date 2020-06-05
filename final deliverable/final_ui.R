### UI

source("final_server.R")

ui <- navbarPage(
  "Americans Sleeping Analysis",

  ## Introduction page (HTML)
  introduction <- tabPanel("Introduction",
                    mainPanel(
                      includeHTML("into_paragraph.html"),
                    )
  ),

  ## First graph (Boxplot)
  page1 <- tabPanel("Age",
                  titlePanel("Average Sleeping Hours by Age Group"),
                  sidebarLayout(
                    sidebarPanel(

                      ### Widgets to modify the boxplot
                      radioButtons(
                        "Age",
                        label = "Choose an age group",
                        choices = list(
                          "15 years and over" = "15 years and over",
                          "15 to 24 years" = "15 to 24 years",
                          "25 to 34 years" = "25 to 34 years",
                          "35 to 44 years" = "35 to 44 years",
                          "45 to 54 years" = "45 to 54 years",
                          "55 to 64 years" = "55 to 64 years",
                          "65 years and over" = "65 years and over"
                        ),
                        selected = "15 years and over"
                      )
                    ),

                    ### Plot the boxplot
                    mainPanel(
                      h4("This plot shows the relationship between the types of days
                         and hours slept in each age group"),
                      plotlyOutput("plot1")
                    )
                  )
  ),

  ## Second graph (another boxplot)
  page2 <- tabPanel("Sex",
                  titlePanel("Average Sleeping Hours by Sex"),
                  sidebarLayout(
                    sidebarPanel(

                      ### Widgets to modify the boxplot
                      radioButtons(
                        "Sex",
                        label = "Choose a sex",
                        choices = list(
                          "Both" = "Both",
                          "Men" = "Men",
                          "Women" = "Women"
                        ),
                        selected = "Both"
                      )
                    ),

                    ### Plot the boxplot
                    mainPanel(
                      h4("This plot shows the relationship between the age group
                         and hours slept in each sex"),
                      plotlyOutput("plot2")
                    )
                  )
  ),

  ### Third graph (Scatterplot)
  page3 <- tabPanel("Dataset Exploration",
    titlePanel("Time Americans Spend Sleeping Dataset Exploration"),
    sidebarLayout(
      sidebarPanel(

        ### Widgets to modify the scatterplot
        x_input,
        y_input,
        color_input,
        size_input

      ),

      ### Plots the scatterplot
      mainPanel(
        plotlyOutput("scatter"),
        h4("The purpose of this scatterplot is to explore the
           coorelations between different values in the data set.")
      )
    )
  ),

  ### Conclusion page (HTML)
  conclusion <- tabPanel("Conclusion",
    mainPanel(
      includeHTML("conclusion.html")
    )
  )
)
