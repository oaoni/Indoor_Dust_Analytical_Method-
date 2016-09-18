temp = list.files(pattern = "*.csv") #Contains all data files in the directory

name.list = c("CY3090", "Biogen", "Blank", "CYGC", "Farm", "FA", "FS", "LF1", "LM", "Lucia", "ML", "NAT", "XL", "YF2", "ZJ") #List of desired names for each data file
  
#Function for converting NA values to 0 in sample sets 
na.zero <- function (x)
{
  x[is.na(x)] <- 0
  return(x)
}

#Function that converts string to associated variable name
var.name <- function (str.name)
{
  variable <- eval(parse(text = str.name))
  return(variable)
}

#Creating and naming data frame for each data file in directory
for (i in 1:length(temp))
{
  #Assign name of each data file in working directory
  assign(name.list[i], read.csv(temp[i], header = T, stringsAsFactors = FALSE, na.strings = c("NA", "N/A", "")))
  #converting n/a values to 0 with na.zero function through assign function
  assign(name.list[i], na.zero(var.name(name.list[i])))
}

