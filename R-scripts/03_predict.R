#install.packages("bnlearn")
#install.packages("caret");

library("bnlearn");
library("caret");

#setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");

dfull1 = read.csv("dataset.csv", header = TRUE);
dfull1$winner = factor(ifelse(dfull1$winner == "home", "home", "away"));

dfull1$id = NULL;
dfull1$league_id = NULL;
dfull1$home_goals = NULL;
dfull1$away_goals = NULL;
dfull1$home_def_count = NULL;
dfull1$away_def_count = NULL;
dfull1$home_mid_count = NULL;
dfull1$away_mid_count = NULL;
dfull1$home_atk_count = NULL;
dfull1$away_atk_count = NULL;
dfull1$home_atk_score = NULL;
dfull1$home_def_score = NULL;
dfull1$away_atk_score = NULL;
dfull1$away_def_score = NULL;

#dag = mmhc(dfull1);
#dag = tabu(dfull1);
#dag = gs(dfull1);
#dag = hpc(dfull1);
#dag = mmpc(dfull1);


## Build structure

home_attr = c("home_gk", "home_def", "home_mid", "home_atk");
away_attr = c("away_gk", "away_def", "away_mid", "away_atk");
bl = rbind(
  as.matrix(expand.grid(home_attr, away_attr)),
  as.matrix(expand.grid(away_attr, home_attr))
);

connect_to_winner = c("home_def", "away_def", "home_atk", "away_atk", 
                      "home_mid", "away_mid", "home_gk", "away_gk");

# auto building with blacklist and whitlist
dag = hc(dfull1, blacklist = bl#, 
         #whitelist = data.frame(from = connect_to_winner,to = rep("winner", length(connect_to_winner)))
         );
plot(dag);


## divide into train and test set
smp_size <- floor(0.75 * nrow(dfull1))
train_ind <- sample(seq_len(nrow(dfull1)), size = smp_size)
dtrain <- dfull1[train_ind, ]
dtest <- dfull1[-train_ind, ]


## LEARNING MODEL
fitted = bn.fit(dag, dtrain);

## query
# res = cpquery(
#   fitted,
#   event = (winner == "home"),
#   evidence = ((home_mid == "very good") & (away_mid == "very bad"))
# );
# print(res);

resk = bn.cv(method = "k-fold", data = dfull1, bn = dag, loss = "pred", loss.args = list(target = "winner"));
print(resk)


# Prediction
pred = matrix(0, nrow = length(1000), ncol = ncol(dfull1));
for (col in colnames(pred)){
  pred[, col] = predict(fitted, node = col, data = dtest[, nodes(dag)]);
}
print(pred);


#pred = predict(fitted, "winner", dtest, prob=TRUE);
#cat("Accuracy:", mean(pred == dtest$winner, na.rm = TRUE));




