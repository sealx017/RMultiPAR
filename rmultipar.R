#install and load the required packages------------------------
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("GENESIS")
install.packages(c("systemfit"))

library(GENESIS)
library(systemfit)
#---------------------------------------------------------------

#load the data--------------------------------------------------
G<-as.matrix(read.csv("G.csv",header=F))
colnames(G)<-NULL
ID<-read.csv("ID.csv")
cov<-read.csv("cov.csv")
Y<-read.csv("phen.csv", sep = ",")
snp<-read.table("snp.csv")$V1
#---------------------------------------------------------------

#Run the final program------------------------------------------------
source("sur.R",local=T)
rmultipar()


