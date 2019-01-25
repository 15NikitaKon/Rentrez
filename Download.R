library(rentrez)
library(ggplot2)
library(tidyverse)

#create vector with select NCBI acccesion IDs
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

getwd()
#pass unique identifiers to an NCBI database and receive data files in a variety of formats
## db - name of the database to use = nuccore
## id -  vector (numeric or character), unique ID(s) for records in database db
## rettype - mode in which to recieve data (fasta type)
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#check contents and proper formatting of Bburg
Bburg

#replace every '>HQ' (except for the first >HQ) with 'SPLIT>HQ'
Cburg <- gsub("[^ \\A]>HQ", "SPLIT >HQ", Bburg)
Cburg

#split the vector at each instance of 'SPLIT'
#splits the vector into 3 seperate components, being seperate sequences
Dburg<- strsplit(Cburg, "SPLIT ", fixed=FALSE)
Dburg

#create csv file of the 3 component vector, Dburg
write.csv(Dburg, "Sequences.csv")
