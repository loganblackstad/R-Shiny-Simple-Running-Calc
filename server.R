library(shiny)
library(car)    # Import library to use recode() function
library(shinyTime)

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    # Calculate the interest and amount    
    observe({
        input$action_Calc
        values$pace_minutes <- isolate({
            floor((input$num_hours * 3600 + input$num_minutes * 60 + input$num_seconds)/60/
            recode(input$select_distance, "1 = '26.2'; 2 = '13.2'; 3 = '6.2'"))
        })
    	values$pace_seconds <- isolate({
            signif( ((input$num_hours * 3600 + input$num_minutes * 60 + input$num_seconds)/60/
            recode(input$select_distance, "1 = '26.2'; 2 = '13.2'; 3 = '6.2'"))%%1 * 60,2)
        })
    #    values$amt <- isolate(input$num_principal) + values$int
    
    })

    # Display values entered
    output$text_hours <- renderText({
        input$action_Calc
        paste("Hours: ", isolate(input$num_hours))
    })
    
    output$text_minutes <- renderText({
        input$action_Calc
        paste("Minutes: ", isolate(input$num_minutes))
    })
    
    output$text_seconds <- renderText({
        input$action_Calc
        paste("Seconds: ", isolate(input$num_seconds))
    })
        
    output$text_distance <- renderText({
        input$action_Calc
        paste("Distance: ", recode(isolate(input$select_distance), "1 = 'Marathon'; 2 = 'Half-Marathon'; 3 = '10K'"))
    })
    
    output$text_time <- renderText({
        input$action_Calc
        paste("Estimated Race Time: ", isolate(input$num_hours), ":", isolate(input$num_minutes), ":", isolate(input$num_seconds))
    })

    output$time_output1 <- renderText(strftime(input$time_input1, "%T"))
   

    # Display calculated values
    
    output$text_pace <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Pace [min/mi]:  ", values$pace_minutes, "min ", values$pace_seconds, "sec", sep = "")
    })

    
    
#    output$text_amt <- renderText({
#        if(input$action_Calc == 0) ""
#        else 
#            paste("Total Amount, i.e. Principal plus Interest [$]:", values$amt)
#    })

})