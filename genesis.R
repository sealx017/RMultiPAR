
genesis<-function(i){
  coldata<-cbind(ID,Y[,i],cov)
  cov.names<-colnames(cov)
  colnames(coldata)[c(1,2)]<-c("scanID","pheno")
  coldata<-as.data.frame(coldata)
  rownames(coldata)<-coldata$scanID
  nullmod <- try(fitNullModel(coldata, outcome = "pheno", covars = cov.names, cov.mat=G,family = gaussian),TRUE)
  residuals[,i]<<-nullmod$cholSigmaInv%*%as.matrix(nullmod$resid.marginal)
  transformed_snp[,i]<<-nullmod$cholSigmaInv%*%snp
  colnames(residuals)[i]<<-paste("Y",i,sep="")
  colnames(transformed_snp)[i]<<-paste("SNP",i,sep="")
  transformed_intercept[,i]<<-nullmod$cholSigmaInv%*%matrix(1,nindiv,1)
  colnames(transformed_intercept)[i]<<-paste("intercept",i,sep="")
}
