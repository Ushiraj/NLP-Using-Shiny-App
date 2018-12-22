#---------------------------------------------------------------------#
#               Name: Primal Roy Verma ID: 11810120                             #
#               Name: Sandeep Gupta	   ID: 11810085                             #
#               Name: Ushiraj Garg     ID: 11810111                             #
#---------------------------------------------------------------------#


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
                              p("To determine co-occurrence plot, please upload your data in text format.",align="justify"),
                              p("This application supports languages based on UTF-8 encoding.",align="justify"),
                              p("Please refer to the link below for sample text file."),
                              a(href="https://github.com/Ushiraj/NLP-Using-Shiny-App/blob/master/Nokia_Lumia_reviews.txt","Sample data input file"),   
                              br(),
                              p("Please refer to the link below for sample trained model"),
                              a(href="https://github.com/Ushiraj/NLP-Using-Shiny-App/blob/master/english-ud-2.0-170801.udpipe","Sample trained model"),
                              br(),
                              h4('How to use this App'),
                              p('To use this app, click on', span(strong("Upload your text file with data")),'and upload the text file with your data in the preferred language.'),
                              p('Upload the trained model of your chosen language by clicking on', span(strong("Upload your trained model for your preferred language")),'.')
                     ),
                     tabPanel("Annotated table",p("The annotated data of the given text are as follows:"),tableOutput("table1")),
                     tabPanel("Co-occurrence plot",p("The co-occurrence plot is a shown below"), plotOutput("plot1"))
                     
                     
                     
                     
        )
      )
    )
  )
)
