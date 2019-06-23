#install.packages("jsonlite");
#install.packages("bnlearn")

library.path = "C:/Users/mbass/Documents/R/win-library/3.5";
library("jsonlite", lib.loc = library.path);
library("bnlearn", lib.loc = library.path);

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
#setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");

# load data and bayesian network
row = as.data.frame(fromJSON("tempData.json"));
bn = read.dsc("bayesian_network.rds");

# programmatically build a conditional probability query...
event = paste("(", row[1,"query_name"], " == '",
              row[1,"query_value"], "')",
              sep = "", collapse = " & ");

row$query_name = NULL;
row$query_value = NULL;

evidence = paste("(", colnames(row), " == '",
                 sapply(row[1, ], as.character), "')",
                 sep = "", collapse = " & ");

# compute result
cmd = paste("cpquery(bn, ", event, ", ", evidence, ")", sep = "");
res = eval(parse(text = cmd));

# serve result to cmd
cat(res);
