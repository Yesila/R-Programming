pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  #template  ... file <- read.csv('R Programming/specdata/001.csv')
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  values = c()
  
  for(id_num in id){
    
    if(id_num < 10){id_num <- paste(c(0,id_num), collapse = '')}
    if(id_num < 100){id_num <- paste(c(0,id_num), collapse = '')}
    #file_name <- c('R Programming/', directory, '/', id_num, '.csv')
    file_name <- c(directory, '/', id_num, '.csv')
    
    file_name <- paste(file_name, collapse = '')
    file <- read.csv(file_name)
    
    desired_values <- file[pollutant][!is.na(file[pollutant])]
    
    values <- c(values, desired_values)
      
  }
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  mean(values)
}