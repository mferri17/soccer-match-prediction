#install.packages("bnlearn")

library("bnlearn");

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");

net = readRDS("bayesian_network.rds");

res = cpquery(
  fitted,
  event = (winner == "home"),
  evidence = ((home_mid == "very good") & (away_mid == "very bad"))
);

cat(res);
