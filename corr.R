corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  #source('R Programming/complete.R')
  source('complete.R')
  
  comp <- complete(directory)
  
  comp <- comp[comp$nobs > threshold, ]
  
  cor_vec <- c()
  
  for(id_num in comp$id){
    if(id_num < 10){id_num <- paste(c(0,id_num), collapse = '')}
    if(id_num < 100){id_num <- paste(c(0,id_num), collapse = '')}
    #file_name <- c('R Programming/', directory, '/', id_num, '.csv')
    file_name <- c(directory, '/', id_num, '.csv')
    file_name <- paste(file_name, collapse = '')
    file <- read.csv(file_name)
    
    file <- file[complete.cases(file), ]
    
    cor_vec <- c(cor_vec, cor(file$nitrate, file$sulfate))
    
  }
  
  cor_vec
  
  ## Return a numeric vector of correlations
}