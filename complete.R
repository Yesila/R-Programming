complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ids <- c()
  nobs <- c()
  
  for(id_num in id){
    
    ids <- c(ids, id_num)
    
    if(id_num < 10){id_num <- paste(c(0,id_num), collapse = '')}
    if(id_num < 100){id_num <- paste(c(0,id_num), collapse = '')}
    #file_name <- c('R Programming/', directory, '/', id_num, '.csv')
    file_name <- c(directory, '/', id_num, '.csv')
    file_name <- paste(file_name, collapse = '')
    file <- read.csv(file_name)
    
    
    file <- file[complete.cases(file),]
    
    nobs <- c(nobs, nrow(file))
  }
  
  data.frame('id' = ids, 'nobs' = nobs)
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}