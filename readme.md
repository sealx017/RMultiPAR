# Description

RMultiPAR (Rapid Multiple Phenotypes Association analysis in Related individuals) uses a two-stage approach to test the association of multiple continuous phenotypes with a single genetic marker in families or distantly related individuals. The R function rmultipar implements this association test. 

For details of this statistical method, please refer/cite:

Souvik S., Saonli B., "Multivariate Association Analysis with Correlated Traits in Families or Distantly Related Individuals".
### Keywords:
Multivariate multiple linear regression; Linear mixed model; Feasible generalized least square; Seemingly unrelated regression; Multiple phenotypes; Family data; Distantly related individuals; Genetic similarity matrix; UK Biobank data.

# Instructions to run RMultiPAR
## Files Required
1. A phenotype file (phen.csv) which contains multiple phenotypes(columns) over different individuals(rows).
2. An ID file (ID.csv) carrying the IDs corresponding to the individuals.
3. A covariates file (cov.csv) with single or multiple covariates.
4. A snp data file (snp.csv) which has (0/1/2) values. 
5. A kinship matrix/GRM (G.csv) which is pre-computed either using known familial relations or using SNPs.

*Order of the individuals should be the same in all the files. Missing values (NA) are not currently supported.

## Packages required
R (>=3.5.0). GENESIS, systemfit (The function rmultipar includes commands to install them).

## Function explained
User should create the datasets as mentioned above and place them into the same folder as the functions. Then run only the function rmultipar to get RMultiPAR test statistic value, p value and the degress of freedom. 

*If the user wants to specify custom filenames and file locations, he/she should change the data loading part of the rmultipar funcion accordingly.

