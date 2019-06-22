#install.packages("jsonlite");
#install.packages("bnlearn")

library("jsonlite");
library("bnlearn");

#setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");

dataframe = as.data.frame(fromJSON("tempData.json"));

net = readRDS("bayesian_network.rds");

source("ui_row_transform.R");
row = mapRow(dataframe[0,]);


res = cpquery(
  fitted,
  event = (winner == "home"),
  evidence = ((home_def_score == row$home_def_score) & 
                (home_atk_score == row$home_atk_score) &
                (away_def_score == row$away_def_score) &
                (away_atk_score == row$away_atk_score))
);

cat(res);
