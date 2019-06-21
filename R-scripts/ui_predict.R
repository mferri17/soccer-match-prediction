#install.packages("jsonlite");
#install.packages("bnlearn")

library("jsonlite");
library("bnlearn");

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");

dataframe = as.data.frame(fromJSON("tempData.json"));

net = readRDS("bayesian_network.rds");

# res = cpquery(
#   fitted,
#   event = (winner == "home"),
#   evidence = ((home_mid == "very good") & (away_mid == "very bad"))
# );

res = 0.7;

cat(res);
