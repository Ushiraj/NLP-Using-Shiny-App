# Define Server function




shinyServer(function(input, output) {
  
  options(shiny.maxRequestSize=30*1024^2)  #remove limits to file upload via UI side
  
  Dataset <- reactive({
    if (is.null(input$file1)) { return(NULL) }
    else{
      
      corpus <- readLines(input$file1$datapath)
      corpus <-  str_replace_all(corpus, "<.*?>", "")
      return(corpus)
    }
  })
  
  
  annotated_data <- reactive({
	  #windowsFonts(devanew=windowsFont("Devanagari new normal"))
    if(is.null(input$file2)){return(NULL)}
    else {
	  
      lang_model <- udpipe_load_model(input$file2$datapath)
      ann <- udpipe_annotate(lang_model, x = Dataset())
      ann <- as.data.frame(ann)
      return(ann)
    }
  })
  
  UPOS <- reactive({
      return(input$pos)
  })
  
  
  data_cooc <- reactive({
	  #windowsFonts(devanew=windowsFont("Devanagari new normal"))
    cooccurrence(
      x=subset(annotated_data(),upos %in% UPOS()),term="lemma",group=c("doc_id","paragraph_id","sentence_id"))
    
  })
  
  output$plot1 <- renderPlot({ 
	  #windowsFonts(devanew=windowsFont("Devanagari new normal"))
	if (is.null(input$file1)) { return(NULL) }
	else {
    wordnetwork <- head(data_cooc(), 50)
    wordnetwork <- igraph::graph_from_data_frame(wordnetwork)
    
    ggraph(wordnetwork, layout = "fr") +  
      
      geom_edge_link(aes(width = cooc, edge_alpha = cooc), edge_c
  
  output$table1 <- renderTable({
    head(annotated_data())olour = "orange") +  
      geom_node_text(aes(label = name), col = "darkgreen", size = 4) +
      
      theme_graph(base_family = "Arial Narrow") +  
      theme(legend.position = "none") +
      
      labs(title = "Cooccurrences within 3 words distance", subtitle = "Based on selected parts of speech")   
  })
  
         }
  })
  
  
})