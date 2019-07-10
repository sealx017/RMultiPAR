rmultipar<-function(){
  ntrait<-dim(Y)[2]
  nindiv<-dim(Y)[1]
  residuals<-transformed_snp<-as.data.frame(matrix(0,nindiv,ntrait))
  transformed_intercept<-as.data.frame(matrix(0,nindiv,ntrait))
  source("genesis.R",local=T)
  lapply(1:ntrait,genesis)
  hypothesis.matrix<-matrix(0,ntrait,2*ntrait)
  for(m in 1:ntrait){hypothesis.matrix[m,(2*m)]<-1}
  r<-matrix(0,ntrait,1)
  for(i in 1:ntrait){
    y<-(paste("Y",i,sep=""))
    x2<-(paste("SNP",i,sep=""))
    x1<-(paste("intercept",i,sep=""))
    r[i,1] <- paste(y,"~",0,"+",x1,"+",x2)
  }
  formulapply<-lapply(r,as.formula)
  coldata<-do.call(cbind,list(residuals,transformed_snp,transformed_intercept))
  fitsur <- systemfit(formulapply, data=coldata,method = "SUR",maxiter=500)
  coeff<-fitsur$coefficients
  hyp<-linearHypothesis(fitsur,hypothesis.matrix, test = c( "Chisq" ))
  rmultipar.statistic<-hyp$Chisq[2]
  rmultipar.pvalue<-hyp$"Pr(>Chisq)"[2]
  result<-list(test.stat=rmultipar.statistic,pvalue=rmultipar.pvalue,df=ntrait)
  print(result)
}