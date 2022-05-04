#############################

# k-medoids clustering analysis

# Code written by Julien Siracusa for the study:
# Chalchat et al. (2022). "Appropriateness of indirect markers of muscle damage 
# following lower limbs eccentric-biased exercises: A systematic review with 
# meta-analysis".

#############################


# This script was prepared to performed a k-medoids (or partitioning around 
# medoids, PAM) clustering analysis on the largest reduction in SMD torque 
# at 24-48 h post-exercise (MVCloss 24-48h) collected for the 141 experimental 
# groups. 

# folders required:
# data: "dataMVC_meta"

# Install packages:

install.packages(c("factoextra", "cluster", "NbClust","readr"))


# Load packages

library(factoextra)
library(cluster)
library(NbClust)
library(readr)


# Paste the data set (dataMVC_meta.txt) in the file obtain with the command below

getwd()

# Load the data set

dataMVC_meta <- read_delim("dataMVC_meta.txt", 
                           delim = "\t", escape_double = FALSE, 
                           locale = locale(decimal_mark = ","), 
                           na = "NA", trim_ws = TRUE)

dataPAM <- as.data.frame(dataMVC_meta[,-c(1:3)])

# Estimating the optimal number of clusters

set.seed(2022)

nb <- NbClust(dataPAM, diss=NULL, distance = "euclidean", 
              min.nc=2, max.nc=5, method = "centroid", 
              index = "all", alphaBeale = 0.1)

# Computing PAM clustering

pam.res <-pam(dataPAM, 3, metric = "manhattan", stand = FALSE)

pam.res$clusinfo
pam.res$medoids

# Print results

print(pam.res)

dataPrint <- cbind(dataMVC_meta, cluster = pam.res$cluster)

write.table(dataPrint, file = "dataMVC_meta_clusters.txt", sep = " ", dec = ".", row.names = FALSE, col.names = TRUE)


