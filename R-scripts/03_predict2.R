# install.packages("DataExplorer", dependencies = TRUE);
# install.packages("igraph", dependencies = TRUE);
# install.packages("bnlearn", dependencies = TRUE);
# install.packages("caret", dependencies = TRUE);
# install.packages("gower", dependencies = TRUE);
# install.packages("arules", dependencies = TRUE);

library("DataExplorer");
library("bnlearn");
library("caret");

#setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");



## DATASET

dfull2 = read.csv("dataset.csv", header = TRUE);

## redicing to binary problem
dfull2$winner = factor(ifelse(dfull2$winner == "home", "home", "not home"));

dfull2$id = NULL;
dfull2$league_id = NULL;
dfull2$home_goals = NULL;
dfull2$away_goals = NULL;
dfull2$home_def_count = NULL;
dfull2$away_def_count = NULL;
dfull2$home_mid_count = NULL;
dfull2$away_mid_count = NULL;
dfull2$home_atk_count = NULL;
dfull2$away_atk_count = NULL;



# NET CREATION

#dag = mmhc(dfull2);
#dag = tabu(dfull2);
#dag = gs(dfull2);
#dag = hpc(dfull2);
#dag = mmpc(dfull2);
#dag = hc(dfull2);

dag = model2network("[home_gk][home_def][home_mid][home_atk][home_def_score|home_gk:home_def:home_mid][home_atk_score|home_mid:home_atk][away_gk][away_def][away_mid][away_atk][away_def_score|away_gk:away_def:away_mid][away_atk_score|away_mid:away_atk][winner|home_def_score:home_atk_score:away_def_score:away_atk_score]");
plot(dag);




## LEARNING MODEL

# divide into train and test set
smp_size <- floor(0.75 * nrow(dfull2))
train_ind <- sample(seq_len(nrow(dfull2)), size = smp_size)
train <- dfull2[train_ind, ]
test <- dfull2[-train_ind, ]

# learning
fitted = bn.fit(dag, train);

## save model on file
#write.dsc("bayesian_network_2.rds", fitted);

## performance
pred = predict(fitted, "winner", test, prob=TRUE);
cat("Accuracy:", mean(pred == test$winner, na.rm = TRUE));



### CROSS VALIDATION

n = 10;
global.accuracy = c();

folds <- cut(seq(1, nrow(dfull2)), breaks=n, labels=FALSE);

for(i in 1:n){
  testIndexes <- which(folds==i,arr.ind=TRUE);
  testData <- dfull2[testIndexes, ];
  trainData <- dfull2[-testIndexes, ];
  
  fitted = bn.fit(dag, trainData); # LEARNING MODEL
  pred = predict(fitted, "winner", testData);
  accuracy = mean(pred == testData$winner, na.rm = TRUE);
  accuracy
  global.accuracy = c(global.accuracy, accuracy);
}

cat("\n\n AVG ACCURACY ON ", n, " FOLDS: ", mean(global.accuracy), "\n\n");


