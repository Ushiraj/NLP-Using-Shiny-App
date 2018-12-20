#Define ui function



shinyUI(
  fluidPage(
    titlePanel("Natural Language Processing"),
      sidebarLayout(
       sidebarPanel(
          fileInput("file1","Upload your text file with data"),
          fileInput("file2","Upload your trained model for your preferred language",width=NULL),
          checkboxGroupInput("pos", label = h3("Check your preferred Parts of Speech"), 
                             choices = list("Adjective" = "ADJ", "Noun" ="NOUN", "Proper Noun" = "PROPN", "Adverb"= "ADV", "Verb" = "VERB"), selected =c("ADJ","NOUN","PROPN") )
          ),
  mainPanel(
    tabsetPanel( type="tabs",
                 tabPanel("Overview"),
                 tabPanel("Annotated table",tableOutput("table1")),
                 tabPanel("Co-occurrence plot", plotOutput("plot1"))
                 
     )
    
    
    )
  )
)
)

