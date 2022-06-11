require(caret)
require(SQUAREM)
require(ranger)

model <- readRDS("model.rds", "rb")

createDataFrame <- function(input) {
  return(
    data.frame(
      school = input$school,
      sex = input$sex,
      age = input$age,
      address = input$address,
      famsize = input$famsize,
      Pstatus = input$Pstatus,
      Medu = input$Medu,
      Fedu = input$Fedu,
      Mjob = input$Mjob,
      Fjob = input$Fjob,
      reason = input$reason,
      guardian = input$guardian,
      traveltime = input$traveltime,
      studytime = input$studytime,
      failures = input$failures,
      schoolsup = input$schoolsup,
      famsup = input$famsup,
      paid = input$paid,
      activities = input$activities,
      nursery = input$nursery,
      higher = input$nursery,
      internet = input$internet,
      romantic = input$romantic,
      famrel = input$famrel,
      freetime = input$freetime,
      goout = input$goout,
      Dalc = input$Dalc,
      Walc = input$Walc,
      health = input$health,
      absences = input$absences,
      G1 = input$G1,
      G2 = input$G2,
      G3 = 0
    )
  )
}

updateFactors <- function(df) {
  df$school <- factor(df$school, levels = c("GP", "MS"))

  df$sex <- factor(df$sex, levels = c("F", "M"))

  df$address <- factor(df$address, levels = c("R", "U"))

  df$famsize <- factor(df$famsize, ordered = TRUE, levels = c("LE3", "GT3"))

  df$Pstatus <- factor(df$Pstatus, levels = c("A", "T"))

  df$Medu <- factor(df$Medu, ordered = TRUE, levels = 0:4)

  df$Fedu <- factor(df$Fedu, ordered = TRUE, levels = 0:4)

  df$Mjob <- factor(df$Mjob, levels = c("at_home", "health", "other", "services", "teacher"))

  df$Fjob <- factor(df$Fjob, levels = c("at_home", "health", "other", "services", "teacher"))

  df$reason <- factor(df$reason, levels = c("course", "home", "other", "reputation"))

  df$guardian <- factor(df$guardian, levels = c("father", "mother", "other"))

  df$traveltime <- factor(df$traveltime, ordered = TRUE, levels = 1:4)

  df$studytime <- factor(df$studytime, ordered = TRUE, levels = 1:4)

  df$failures <- factor(df$failures, ordered = TRUE, levels = 0:4)

  df$schoolsup <- factor(df$schoolsup, levels = c("no", "yes"))

  df$famsup <- factor(df$famsup, levels = c("no", "yes"))

  df$paid <- factor(df$paid, levels = c("no", "yes"))

  df$activities <- factor(df$activities, levels = c("no", "yes"))

  df$nursery <- factor(df$nursery, levels = c("no", "yes"))

  df$higher <- factor(df$higher, levels = c("no", "yes"))

  df$internet <- factor(df$internet, levels = c("no", "yes"))

  df$romantic <- factor(df$romantic, levels = c("no", "yes"))

  df$famrel <- factor(df$famrel, ordered = TRUE, levels = 1:5)

  df$freetime <- factor(df$freetime, ordered = TRUE, levels = 1:5)

  df$goout <- factor(df$goout, ordered = TRUE, levels = 1:5)

  df$Dalc <- factor(df$Dalc, ordered = TRUE, levels = 1:5)

  df$Walc <- factor(df$Walc, ordered = TRUE, levels = 1:5)

  df$health <- factor(df$health, ordered = TRUE, levels = 1:5)

  return(df)
}

function(input, output, session) {
  observeEvent(input$predictBtn, {
    df <- updateFactors(createDataFrame(input))

    score <- round(predict(model, newdata = df))

    if (score > 20) {
      score <- 20
    }

    if (score < 0) {
      score <- 0
    }

    result <- ifelse(score >= 10, "PASS", "FAIL")

    output$score <- renderText({ score })
    output$result <- renderText({ result })
  })
  
  observeEvent(input$resetBtn, {
    session$reload()
  })
  
  output$score <- renderText({ "-" })
  output$result <- renderText({ "-" })
}
