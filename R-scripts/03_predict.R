# install.packages("DataExplorer", dependencies = TRUE);
# install.packages("igraph", dependencies = TRUE);
# install.packages("bnlearn", dependencies = TRUE);
# install.packages("caret", dependencies = TRUE);
# install.packages("gower", dependencies = TRUE);
# install.packages("arules", dependencies = TRUE);

library("DataExplorer");
library("bnlearn");
library("caret");

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
#setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");



## DATASET

dfull1 = read.csv("dataset.csv", header = TRUE);

## redicing to binary problem
dfull1$winner = factor(ifelse(dfull1$winner == "home", "home", "not home"));

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



## NET ASSUMPTIONS

home_attr = c("home_gk", "home_def", "home_mid", "home_atk");
away_attr = c("away_gk", "away_def", "away_mid", "away_atk");

bl = rbind(
  as.matrix(expand.grid(home_attr, away_attr)),
  as.matrix(expand.grid(away_attr, home_attr))
);

connect_to_winner = c("home_def", "away_def", "home_atk", "away_atk", 
                      "home_mid", "away_mid", "home_gk", "away_gk");
wl = data.frame(from = connect_to_winner,to = rep("winner", length(connect_to_winner)));



# NET CREATION

#dag = mmhc(dfull1);
#dag = tabu(dfull1);
#dag = gs(dfull1);
#dag = hpc(dfull1);
#dag = mmpc(dfull1);

dag = hc(dfull1, blacklist = bl
         #, whitelist = wl
         );

plot(dag);





## LEARNING MODEL

# divide into train and test set
smp_size <- floor(0.75 * nrow(dfull1))
train_ind <- sample(seq_len(nrow(dfull1)), size = smp_size)
dtrain <- dfull1[train_ind, ]
dtest <- dfull1[-train_ind, ]

# learning
fitted = bn.fit(dag, dtrain);

## save model on file
write.dsc("bayesian_network.rds", fitted);

# performance
pred = predict(fitted, "winner", dtest);
cat("Accuracy:", mean(pred == dtest$winner, na.rm = TRUE));

## query
res = cpquery(
  fitted,
  event = (winner == "away/draw"),
  evidence = ((home_mid == "terrible") & (away_def == "good"))
);
print(res);




## CROSS VALIDATION

n = 10;
global.accuracy = c();

folds <- cut(seq(1, nrow(dfull1)), breaks=n, labels=FALSE);

for(i in 1:n){
  testIndexes <- which(folds==i,arr.ind=TRUE);
  testData <- dfull1[testIndexes, ];
  trainData <- dfull1[-testIndexes, ];
  
  fitted = bn.fit(dag, trainData); # LEARNING
  pred = predict(fitted, "winner", testData); # PREDICTION
  
  accuracy = mean(pred == testData$winner, na.rm = TRUE);
  global.accuracy = c(global.accuracy, accuracy);
}

cat("\n\n AVG ACCURACY ON ", n, " FOLDS: ", mean(global.accuracy), "\n\n");




## BUILT-IN CROSS VALIDATION

cv = bn.cv(method = "k-fold",
           data = dfull1,
           bn = dag,
           loss = "pred",
           loss.args = list(target = "winner"));
print(cv)





