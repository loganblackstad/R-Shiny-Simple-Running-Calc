library(shiny)
library(shinyTime)

shinyUI(fluidPage(
    titlePanel("Simple Running Pace Calc"),
    sidebarLayout(
        sidebarPanel(
            br(), 
            helpText("This app calculates your running pace 
                     based on your estimated finish time and race distance:"),            
            br(),            
            numericInput("num_hours",
                         label = h6("HH:"),
                         value = 2),
            numericInput("num_minutes",
                         label = h6("MM:"),
                         value = 58),   
            numericInput("num_seconds",
                         label = h6("SS:"),
                         value = 17),           
            br(),            
            selectInput("select_distance",
                        label = h6("Select your race distance"),
                        choices = list("Marathon (26.2 miles)" = 1,
                                       "Half-Marathon (13.1 miles)" = 2,
                                       "10K (6.2 miles)" = 3),
                        selected = 1 
            ), 
            br(),
            timeInput("time_input1", "Enter Your Estimated Time [HH:MM:SS]", value = strptime("01:17:56", "%T")),
            br(),            
            actionButton("action_Calc", label = "Refresh & Calculate")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                    p(h5("Your entered values:")),
                    textOutput("text_hours"),
                    textOutput("text_minutes"),
                    textOutput("text_seconds"),
                    textOutput("text_distance"),
                    textOutput("text_time"),
                    br(),
                    p(h5("Calculated values:")),
                    textOutput("text_pace")
                    textOutput("text_pace_2")
                ),
                tabPanel("Documentation",
                    p(h4("Simple Running Pace Calculator:")),
                    br(),
                    helpText("This application calculates your running pace 
                        based on your inputs."),
                    HTML("<u><b>Equation for calculation: </b></u>
                        <br> <br>
                        <b> Pace [in minutes/mile] = ( (H/60/60) + (M/60) + S ) /D /60 </b>
                        <br>
                        where: <br>
                        H = Hours [HH]<br>
                        M = Minutes [MM]<br>
                        S = Seconds [SS]<br>
                        D = Distance [in miles] <br>
                    ")                
                )
            )
        )
    )
))