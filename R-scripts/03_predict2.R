#install.packages("DataExplorer")
#install.packages("bnlearn")
install.packages("BiocManager")

source("https://bioconductor.org/biocLite.R")
biocLite("BiocInstaller")

library("DataExplorer");
library("bnlearn");
library("graphviz.plot");

#setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");

dfull = read.csv("dataset.csv", header = TRUE);
dfull$winner = factor(ifelse(dfull$winner == "home", "home", "away"));

dfull$id = NULL;
dfull$league_id = NULL;
dfull$home_goals = NULL;
dfull$away_goals = NULL;
dfull$home_def_count = NULL;
dfull$away_def_count = NULL;
dfull$home_mid_count = NULL;
dfull$away_mid_count = NULL;
dfull$home_atk_count = NULL;
dfull$away_atk_count = NULL;

#dag = mmhc(dfull);
#dag = tabu(dfull);
#dag = gs(dfull);
#dag = hpc(dfull);
#dag = mmpc(dfull);
#dag = hc(dfull);

dag = model2network("[home_gk][home_def][home_mid][home_atk][home_def_score|home_gk:home_def:home_mid][home_atk_score|home_mid:home_atk][away_gk][away_def][away_mid][away_atk][away_def_score|away_gk:away_def:away_mid][away_atk_score|away_mid:away_atk][winner|home_def_score:home_atk_score:away_def_score:away_atk_score]");
plot(dag);
graphviz.plot(dag, highlight = NULL, groups, layout = "dot",
              shape = "circle", main = NULL, sub = NULL, render = TRUE)


## divide into train and test set
smp_size <- floor(0.75 * nrow(dfull))
train_ind <- sample(seq_len(nrow(dfull)), size = smp_size)
train <- dfull[train_ind, ]
test <- dfull[-train_ind, ]



## MODEL LEARNING
fitted = bn.fit(dag, train);

## save model on file
saveRDS(dfull, file = "bayesian_network.rds");




# Prediction
pred = predict(fitted, "winner", test, prob=TRUE);
cat("Accuracy:", mean(pred == test$winner, na.rm = TRUE));



## just a query test

# res = cpquery(
#   fitted,
#   event = (winner == "home"),
#   evidence = ((home_mid == "very good") & (away_mid == "very bad"))
# );
# 
# resk = bn.cv(method = "k-fold", data = dfull, bn = dag, loss = "pred", loss.args = list(target = "winner"));





