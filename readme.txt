

###----------------------------------Instructions to run RMultiPAR----------------------------------------------


#Files Required----------------------------------

1. A phenotype file(phen.csv) which contains multiple phenotypes(columns) over different individuals(rows).
2. An ID file(ID.csv) carrying the IDs corresponding to the individuals.
3. A covariates file(cov.csv) with single or multiple covariates.
4. A snp data file(snp.csv) which has (0/1/2) values. 
5. A kinship matrix/GRM(G.csv) which is pre-computed either using known familial relations or using SNPs.

***Order of the individuals should be the same in all the files. 

#Functions explained------------------------------

RMultiPAR involves two steps: 
1)Fitting independent LMMs (done by the function genesis.R)
2)Fitting a seemingly unrelated regression model (done by the function sur.R)
The function rmultipar.R installs the necessary packages, reads the data, loads the above two functions and performs
RMultiPAR providing a chi-square test statistic value, p value and degress of freedom.

#The packages needed to be installed--------------

Two R packages are needed to be installed, namely, GENESIS and systemfit. The function rmultipar.R includes commands to install them.