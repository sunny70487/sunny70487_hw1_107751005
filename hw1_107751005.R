library(argparser)#for command line 
dir = file.path(getwd(),"data","/")#path of  data 
dir_o=file.path(getwd(),"eval","/")
files <- list.files(dir, pattern = "*.csv")#browse data in folder
n=length(list.files(dir, pattern = "*.csv"))
data <- list()
h <- list()
r <- list()
s <- list()
mydata <- list()
#read csv
for(i in 1:n) {
  data[[i]]<- read.csv(paste(dir,files[[i]], sep=""),header=T)
}
#data processing and output to csv 
for(i in 1:n){
  s[[i]] <- paste("input",i,sep="")
  r[[i]] <- max(round(data[[i]]$height,2))
  h[[i]] <- max(round(data[[i]]$weight,2))
  mydata[[i]] <- data.frame(s[[i]],h[[i]],r[[i]])
  names(mydata[[i]]) <- c("set","weight","height")
  write.csv(mydata[[i]],file=paste(dir_o,"output",i,".csv",sep=""),row.names=FALSE)}
#run on the command line
parser <- arg_parser("Process input and output csv")
parser <- add_argument(parser,"--input", help="read input csv file",default="input1")
parser <- add_argument(parser,"--output", help="output result csv file",default="output1")
args <- parse_args(parser, commandArgs(trailingOnly = TRUE))
if (length(args)==0) {
  stop("USAGE: Rscript hw1_exam.R input", call.=FALSE)
}
read.csv(paste(dir,args$input,".csv", sep=""),header=T)
read.csv(paste(dir_o,args$output,".csv", sep=""), header=T)

