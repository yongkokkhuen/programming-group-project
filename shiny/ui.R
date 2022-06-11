require(shinythemes)

app_title <- "Student Performance Prediction"

createSelectInput <- function(inputId, label, choices) {
  return(
    column(
      width = 3,
      selectInput(
        inputId = inputId,
        label = label,
        choices = choices,
        width = "100%"
      )
    )
  )
}

createSliderInput <- function(inputId, label, min, max, value) {
  return(
    column(
      width = 3,
      sliderInput(
        inputId = inputId,
        label = label,
        min = min,
        max = max,
        value = value,
        width = "100%"
      )
    )
  )
}

fluidPage(
  title = app_title,
  
  theme = shinytheme("superhero"),
  
  h2(app_title),
   
  h3("Parameters", style = "margin-bottom: 24px"),
  
  tabsetPanel(
    tabPanel(
      title = "Personal",
      
      fluidRow(
        createSelectInput(
          inputId = "school",
          label = "School",
          choices = c("Gabriel Pereira" = "GP", "Mousinho da Silveira" = "MS")
        ),
        
        createSelectInput(
          inputId = "reason",
          label = "Reason To Choose This School",
          choices = c(
            "Close to home" = "home",
            "School reputation" = "reputation",
            "Course preference" = "course",
            "Other" = "other"
          )
        ),
        
        createSelectInput(
          inputId = "address",
          label = "Address",
          choices = c("Urban" = "U", "Rural" = "R")
        ),
        
        createSelectInput(
          inputId = "health",
          label = "Current Health Status",
          choices = c(
            "Very Bad" = 1,
            "Bad" = 2,
            "Moderate" = 3,
            "Good" = 4,
            "Very Good" = 5
          )
        )
      ),
      
      fluidRow(
        createSelectInput(
          inputId = "sex",
          label = "Sex",
          choices = c("Female" = "F", "Male" = "M")
        ),
        
        createSliderInput(
          inputId = "age",
          label = "Age",
          min = 15,
          max = 22,
          value = 18
        )
      )
    ),
    
    tabPanel(
      title = "Family",
      
      fluidRow(
        createSelectInput(
          inputId = "famsize",
          label = "Family Size",
          choices = c("Less or equal to 3" = "LE3", "Greater than 3" = "GT3")
        ),
        
        createSelectInput(
          inputId = "guardian",
          label = "Student's Guardian",
          choices = c(
            "Mother" = "mother",
            "Father" = "father",
            "Other" = "other"
          )
        ),
        
        createSelectInput(
          inputId = "Pstatus",
          label = "Parent's Cohabitation Status",
          choices = c("Living together" = "T", "Apart" = "A")
        ),
        
        createSelectInput(
          inputId = "famrel",
          label = "Quality Of Family Relationships",
          choices = c(
            "Very bad" = 1,
            "Bad" = 2,
            "Moderate" = 3,
            "Good" = 4,
            "Excellent" = 5
          )
        )
      ),
      
      fluidRow(
        createSelectInput(
          inputId = "Medu",
          label = "Mother's Education",
          choices = c(
            "None" = 0,
            "Primary education (4th grade)" = 1,
            "5th to 9th grade" = 2,
            "Secondary education" = 3,
            "Higher education" = 4
          )
        ),
        
        createSelectInput(
          inputId = "Mjob",
          label = "Mother's Job",
          choices = c(
            "Teacher" = "teacher",
            "Health care related" = "health",
            "Civil services" = "services",
            "At Home" = "'at_home",
            "Other" = "other"
          )
        ),
        
        createSelectInput(
          inputId = "Fedu",
          label = "Father's Education",
          choices = c(
            "None" = 0,
            "Primary education (4th grade)" = 1,
            "5th to 9th grade" = 2,
            "Secondary education" = 3,
            "Higher education" = 4
          )
        ),
        
        createSelectInput(
          inputId = "Fjob",
          label = "Father's Job",
          choices = c(
            "Teacher" = "teacher",
            "Health care related" = "health",
            "Civil services" = "services",
            "At Home" = "'at_home",
            "Other" = "other"
          )
        )
      ),
      
      fluidRow(
        createSelectInput(
          inputId = "famsup",
          label = "Family Educational Support",
          choices = c("Yes" = "yes", "No" = "no")
        )
      )
    ),
    
    tabPanel(
      title = "Academic",
      
      fluidRow(
        createSelectInput(
          inputId = "schoolsup",
          label = "Extra Educational Support",
          choices = c("Yes" = "yes", "No" = "no")
        ),
        
        createSelectInput(
          inputId = "paid",
          label = "Extra Paid Classes Within The Course Subject",
          choices = c("Yes" = "yes", "No" = "no")
        ),
        
        createSelectInput(
          inputId = "activities",
          label = "Extra-Curricular Activities",
          choices = c("Yes" = "yes", "No" = "no")
        ),
        
        createSelectInput(
          inputId = "failures",
          label = "Number Of Past Class Failures",
          choices = c(
            "0" = 0,
            "1" = 1,
            "2" = 2,
            "More than 2" = 3
          )
        )
      ),
      
      fluidRow(
        createSliderInput(
          inputId = "absences",
          label = "Number Of School Absences",
          min = 0,
          max = 93,
          value = 47
        ),
        
        createSliderInput(
          inputId = "G1",
          label = "First Period Grade",
          min = 0,
          max = 20,
          value = 10
        ),

        createSliderInput(
          inputId = "G2",
          label = "Second Period Grade",
          min = 0,
          max = 20,
          value = 10
        )
      )
    ),
    
    tabPanel(
      title = "Time",
      
      fluidRow(
        createSelectInput(
          inputId = "traveltime",
          label = "Home To School Travel Time",
          choices = c(
            "Less than 15 minutes" = 1,
            "15 to 30 minutes" = 2,
            "30 minutes to 1 hour" = 3,
            "More than 1 hour" = 4
          )
        ),
        
        createSelectInput(
          inputId = "studytime",
          label = "Weekly Study Time",
          choices = c(
            "Less than 2 hours" = 1,
            "2 to 5 hours" = 2,
            "5 to 10 hours" = 3,
            "More than 10 hours" = 4
          )
        ),
        
        createSelectInput(
          inputId = "freetime",
          label = "Free Time After School",
          choices = c(
            "Very Low" = 1,
            "Low" = 2,
            "Moderate" = 3,
            "High" = 4,
            "Very High" = 5
          )
        ),
        
        createSelectInput(
          inputId = "goout",
          label = "Going Out With Friends",
          choices = c(
            "Very Low" = 1,
            "Low" = 2,
            "Moderate" = 3,
            "High" = 4,
            "Very High" = 5
          )
        )
      )
    ),
    
    tabPanel(
      title = "Other",
      
      fluidRow(
        createSelectInput(
          inputId = "internet",
          label = "Internet Access At Home",
          choices = c("Yes" = "yes", "No" = "no")
        ),
        
        createSelectInput(
          inputId = "romantic",
          label = "With A Romantic Relationship",
          choices = c("Yes" = "yes", "No" = "no")
        ),
        
        createSelectInput(
          inputId = "Dalc",
          label = "Workday Alcohol Consumption",
          choices = c(
            "Very Low" = 1,
            "Low" = 2,
            "Moderate" = 3,
            "High" = 4,
            "Very High" = 5
          )
        ),
        
        createSelectInput(
          inputId = "Walc",
          label = "Weekend Alcohol Consumption",
          choices = c(
            "Very Low" = 1,
            "Low" = 2,
            "Moderate" = 3,
            "High" = 4,
            "Very High" = 5
          )
        )
      ),
      
      fluidRow(
        createSelectInput(
          inputId = "nursery",
          label = "Attended Nursery School",
          choices = c("Yes" = "yes", "No" = "no")
        ),
        
        createSelectInput(
          inputId = "higher",
          label = "Wants To Take Higher Education",
          choices = c("Yes" = "yes", "No" = "no")
        )
      )
    ),
  ),
  
  br(),
  
  fluidRow(
    style = "margin-bottom: 24px",
    
    column(
      width = 12,
      align = "right",
      
      actionButton(
        inputId = "resetBtn",
        label = "Reset",
        width = "160px"
      ),
      
      actionButton(
        style = "margin-left: 8px",
        inputId = "predictBtn",
        label = "Predict",
        width = "160px",
        class = "btn-primary"
      )
    ),
    
  ),
  
  hr(),
  
  h3("Prediction", style = "margin-bottom: 24px"),
  
  fluidRow(
    column(
      width = 6,
      wellPanel(
        fluidRow(
          column(
            class = "col-xs-6",
            width = 6,
            h4("Score")
          ),
          column(
            class = "col-xs-6",
            width = 6,
            align = "right",
            h4(textOutput(outputId = "score"))
          )
        )
      )
    ),
    
    column(
      width = 6,
      wellPanel(
        fluidRow(
          column(
            class = "col-xs-6",
            width = 6,
            h4("Result")
          ),
          column(
            class = "col-xs-6",
            width = 6,
            align = "right",
            h4(textOutput(outputId = "result"))
          )
        )
      )
    )
  ),
  
  br()
)
