library(shiny)

shinyUI(fluidPage(
    titlePanel("Simple Running Pace Calc"),
    sidebarLayout(
        sidebarPanel(
            helpText("This app calculates your running pace 
                     based on your inputs."),            
            br(),            
            numericInput("num_hours",
                         label = h6("hour:"),
                         value = 2),
            br(),            
            numericInput("num_minutes",
                         label = h6("minute:"),
                         value = 58),
            br(),            
            numericInput("num_seconds",
                         label = h6("seconds:"),
                         value = 17),           
            br(),            
            selectInput("select_distance",
                        label = h6("Select your race distance"),
                        choices = list("Marathon" = 1,
                                       "Half-Marathon" = 2,
                                       "10K" = 3),
                        selected = 1 
            ), 
            br(),
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
                    br(),
                    p(h5("Calculated values:")),
                    textOutput("text_pace")
                ),
                tabPanel("Documentation",
                    p(h4("Simple Running Pace Calculator:")),
                    br(),
                    helpText("This application calculates your running pace 
                        based on your inputs."),
                    HTML("<u><b>Equation for calculation: </b></u>
                        <br> <br>
                        <b> Pace [in minutes/mile] = ((H/60/60) + (M/60) + S) /D /60 </b>
                        <br>
                        where: <br>
                        H = Hours <br>
                        M = Minutes <br>
                        S = Seconds <br>
                        D = Distance [in miles] <br>
                    ")                
                )
            )
        )
    )
))