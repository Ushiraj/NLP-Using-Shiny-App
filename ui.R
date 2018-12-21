#Define ui function



shinyUI(
  fluidPage(
 
    
 #Describe the title panel 
 titlePanel("NLP using UDpipe"),
    sidebarLayout(
       sidebarPanel(
          fileInput("file1","Upload your text file with data"), #Input field to upload the text file with data
          fileInput("file2","Upload your trained model for your preferred language",width=NULL), #Input field to upload the trained document of the preferred language
          checkboxGroupInput("pos", label = h3("Check your preferred Parts of Speech"), 
                             choices = list("Adjective" = "ADJ", "Noun" ="NOUN", "Proper Noun" = "PROPN", "Adverb"= "ADV", "Verb" = "VERB"), selected =c("ADJ","NOUN","PROPN") )
          #Define the checkboxes to enable user to choose among the preferred parts of speech  
          ),
       
  
       
  #Describe the main panel
  mainPanel(
    tabsetPanel( type="tabs",
  
  tabPanel("Overview",
  h4(p("Data input")),
  p("This application supports only text data file.age.",align="justify"),
  p("Please refer to the link below for sample text file."),
  a(href="https://github.com/PrimalRV/alpha/blob/master/wiki_data.csv","Sample data input file"),   
  br(),
  h4('How to use this App'),
  p('To use this app, click on', span(strong("Upload your text file with data")),'and upload the text file having your data in the preferred language.')
    ),
                 tabPanel("Annotated table",p("The annotated data of the given text are as follows:"),tableOutput("table1")),
                 tabPanel("Co-occurrence plot",p("The co-occurrence plot is a shown below"), plotOutput("plot1"))
                 
    
    
    
    )
  )
)
)



