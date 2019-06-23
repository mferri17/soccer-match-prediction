#install.packages("jsonlite");
#install.packages("bnlearn");
#install.packages("arules");

library.path = "C:/Users/mbass/Documents/R/win-library/3.5";
library("jsonlite", lib.loc = library.path);
library("bnlearn", lib.loc = library.path);
library("arules", lib.loc = library.path);

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
#setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");

# load and convert data
source('mapRow.R');
row = mapRow(as.data.frame(fromJSON("tempData.json")));

# remove useless columns, discretize
row$id = NULL;
row$league_id = NULL;
row$winner = factor(row$winner);

for (type in c("home", "away")) {
  gk_key = sprintf("%s_gk", type);
  def_key = sprintf("%s_def", type);
  mid_key = sprintf("%s_mid", type);
  atk_key = sprintf("%s_atk", type);
  
  for (key in c(gk_key, def_key, mid_key, atk_key)) {
    row[[key]] = as.numeric(row[[key]]);

    # discretization interval from notes, derived from 02_transform based on frequency
    if (type == "home" & key == gk_key) {
        breaks = c(-Inf, 66, 71, 74, 77, 80, Inf);
    } else if (type == "home" & key == def_key) {
        breaks = c(-Inf, 65, 69, 72, 74, 76, Inf);
    } else if (type == "home" & key == mid_key) {
        breaks = c(-Inf, 66, 70, 72, 74, 77, Inf);
    } else if (type == "home" & key == atk_key) {
        breaks = c(-Inf, 67, 70, 73, 76, 79, Inf);
    } else if (type == "away" & key == gk_key) {
        breaks = c(-Inf, 66, 71, 74, 77, 80, Inf);
    } else if (type == "away" & key == def_key) {
        breaks = c(-Inf, 65, 69, 72, 74, 76, Inf);
    } else if (type == "away" & key == mid_key) {
        breaks = c(-Inf, 66, 70, 72, 74, 77, Inf);
    } else if (type == "away" & key == atk_key) {
        breaks = c(-Inf, 67, 70, 73, 76, 79, Inf);
    }
    
    row[[key]] = 
      arules::discretize(
                 row[[key]],
                 method = "fixed",
                 breaks = breaks,
                 labels = c("terrible", "bad", "mediocre", "good", "very good", "excellent")
               );
  }

  row[[sprintf("%s_goals", type)]] = NULL;
  row[[sprintf("%s_count", def_key)]] = NULL;
  row[[sprintf("%s_count", mid_key)]] = NULL;
  row[[sprintf("%s_count", atk_key)]] = NULL;
}

row = as.data.frame(row);

# load bayesian network
bn = read.dsc("bayesian_network.rds");

# programmatically build a conditional probability query...
event = sprintf("(winner == '%s')", row[1, "winner"]);

row$winner = NULL;

evidence = paste("(", colnames(row), " == '",
                 sapply(row[1, ], as.character), "')",
                 sep = "", collapse = " & ");

# compute result
cmd = paste("cpquery(bn, ", event, ", ", evidence, ")", sep = "");
res = eval(parse(text = cmd));

# serve result to cmd
cat(res);
