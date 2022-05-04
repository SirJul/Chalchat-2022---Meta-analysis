K-medoids clustering analysis

This is the dataset and code used for:

Chalchat et al. 2022: "Appropriateness of indirect markers of muscle damage following lower limbs eccentric-biased exercises: A systematic review with meta-analysis".

This repository consist of the dataset (dataMVC_meta.txt) and a R script (k-medoid_clustering.R):

dataMVC_meta.txt: This file contains a dataframe in wide format. It is composed of 141 observations and 4 columns.

Column headers and descriptions :
ID:Contain an ID attributed to each experimental group for ordering
study: Contain the name of the first author of the study and the date of publication
group: Contain the name of the experimental group of the observation
XPEAK: Contain the value of largest reduction in SMD torque at 24-48 h post-exercise (MVCloss 24-48h)

k-medoid_clustering.R: This script contains the code needed to compute the k-medoid clustering analysis on the “dataMVC_meta.txt” file. It included the code to install the packages needed for the analysis. The “dataMVC_meta.txt” file should be located in the folder path obtain with the command “getwd()”. The script will generate a new file named “dataMVC_meta_clusters.txt”, the same file as before with a supplemental column “cluster” containing the repartition between three clusters (1: LOW; 2: MOD; 3: HIGH).
