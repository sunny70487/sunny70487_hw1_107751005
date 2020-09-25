library(argparser)
dir = file.path(getwd(),"data","/")
dir_o=file.path(getwd(),"eval","/")
files <- list.files(dir, pattern = "*.csv")
n=length(list.files(dir, pattern = "*.csv"))
data <- list()
h <- list()
r <- list()
s <- list()
mydata <- list()
for(i in 1:n) {
  data[[i]]<- read.csv(paste(dir,files[[i]], sep=""),header=T)
}
for(i in 1:n){
  s[[i]] <- paste("input",i,sep="")
  r[[i]] <- max(round(data[[i]]$height))
  h[[i]] <- max(round(data[[i]]$weight))
  mydata[[i]] <- data.frame(s[[i]],h[[i]],r[[i]])
  names(mydata[[i]]) <- c("set","weight","height")
  write.csv(mydata[[i]],file=paste(dir_o,"output",i,".csv",sep=""),row.names=FALSE)}
p <- arg_parser("Process input and output csv")
p <- add_argument(p,"--input", help="read input csv file")
p <- add_argument(p,"--output", help="output result csv file",default="output1")
args <- parse_args(p, commandArgs(trailingOnly = TRUE))
if (length(args)==0) {
  stop("USAGE: Rscript hw1_exam.R input", call.=FALSE)
}
read.csv(paste(dir,args$input,".csv", sep=""),header=T)
read.csv(paste(dir_o,args$output,".csv", sep=""), header=T)
