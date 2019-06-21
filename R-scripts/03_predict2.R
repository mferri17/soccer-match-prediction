#install.packages("bnlearn")

library("bnlearn");

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
#setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");

data = read.csv("dataset.csv", header = TRUE);
data$winner = factor(ifelse(data$winner == "home", "home", "away"));

data$id = NULL;
data$league_id = NULL;
data$home_goals = NULL;
data$away_goals = NULL;
data$home_def_count = NULL;
data$away_def_count = NULL;
data$home_mid_count = NULL;
data$away_mid_count = NULL;
data$home_atk_count = NULL;
data$away_atk_count = NULL;

#dag = mmhc(data);
#dag = tabu(data);
#dag = gs(data);
#dag = hpc(data);
#dag = mmpc(data);

home_attr = c("home_gk", "home_def", "home_mid", "home_atk");
away_attr = c("away_gk", "away_def", "away_mid", "away_atk");

bl = rbind(
  as.matrix(expand.grid(home_attr, away_attr)),
  as.matrix(expand.grid(away_attr, home_attr))
);

dag = model2network("[home_gk][home_def][home_mid][home_atk][home_def_score|home_gk:home_def:home_mid][home_atk_score|home_mid:home_atk][away_gk][away_def][away_mid][away_atk][away_def_score|away_gk:away_def:away_mid][away_atk_score|away_mid:away_atk][winner|home_def_score:home_atk_score:away_def_score:away_atk_score]");
#dag = hc(data);
fitted = bn.fit(dag, data);

saveRDS(data, file = "bayesian_network.rds");

plot(dag);

res = cpquery(
  fitted,
  event = (winner == "home"),
  evidence = ((home_mid == "very good") & (away_mid == "very bad"))
);

resk = bn.cv(method = "k-fold", data = data, bn = dag, loss = "pred", loss.args = list(target = "winner"));

# Prediction
pred = predict(fitted, "winner", data, prob=TRUE);
predicted_class = pred;
table(predicted_class, data$winner);
cat("Accuracy:", mean(predicted_class == data$winner));

cat(0.7);
