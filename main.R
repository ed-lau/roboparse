
#
# Edward Lau 2017
# lau1@stanford.edu
#

readOboFile <- function(obofile, cols) {
    "
    Read in an obo file and return a flat table. 
    obofile:    character vector from readLines() of an obo file
    cols:       list of values to read, e.g., c('name', 'id')

    "
  
    require("dplyr")

    # Make an empty dataframe to host all entries, with the column names matching the supplied column lists
    dataframe <- matrix(ncol=length(cols), nrow=0) %>% as.data.frame()
    colnames(dataframe) <- cols
    
    current_section = ""
    
    # Iterate each line
    for (i in 1:length(obofile)) {
        print(i)
      
        # Skip empty line
        if (obofile[i] == "") { 
            next
        
        # If this is a [Term] line, start a new mini dataframe "current_entry" and grab the entries specified by the cols arg
        } else if (obofile[i] == "[Term]") {
          
              current_section <- "Term"
              # Check if "current entry" already exists, if it does, then bind to master dataframe and remove it
              if (exists("current_entry")) {
                  #print(current_entry)
                  dataframe <- bind_rows(dataframe, current_entry)
                  rm(current_entry)
              }
                
              # If "current entry" doesn't already exist or is just removed, create the new mini dataframe for the next entry
                current_entry <- matrix(ncol=length(cols), nrow=1) %>% as.data.frame()
                colnames(current_entry) <- cols
        
        # Skipping over TypeDef section so we are only pulling things from [Term]
                # Note this only works if the TypeDef is at the
        } else if (obofile[i] == "[Typedef]"){
            if(exists("current_entry")){
               current_section <- "Typedef"
            }
              
        # For any other line, check if starts with the same as the specified column ID  
        } else {
            if (exists("current_entry") & current_section == "Term") {
                for (j in 1:length(cols)){
                    if (startsWith(obofile[i], cols[j])){
                        current_entry[1,j] = gsub(paste0("^",cols[j],": "),"", obofile[i])
                    }
                }
            }
        }
    }
    
    # Store the last entry since we are not looping back to 
    if (exists("current_entry")) {
        dataframe <- bind_rows(dataframe, current_entry)
        rm(current_entry)
    }
    
    return(dataframe)
}
    