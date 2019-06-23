# install.packages("DataExplorer", dependencies = TRUE);
# install.packages("igraph", dependencies = TRUE);
# install.packages("bnlearn", dependencies = TRUE);
# install.packages("caret", dependencies = TRUE);
# install.packages("gower", dependencies = TRUE);
# install.packages("arules", dependencies = TRUE);

library("DataExplorer");
library("arules");
library("caret");

setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
#setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");



### DATASET

final = read.csv("../dataset/FINAL.csv", header = TRUE);

## remove rows with NA inside
rows = !(is.na(final$home_team_goal)) & !(is.na(final$away_team_goal));
for (type in c("home", "away")) {
  for (i in 1:11) {
    rows = rows & !(is.na(final[[sprintf("%s%d_overall_rating", type, i)]])) & !(is.na(final[[sprintf("%s_player_Y%d", type, i)]]));
  }
}

final = final[rows, ];


### FEATURES COMPUTATION

source('mapRow.R');

# dataframe transform
lists = apply(final, 1, mapRow);
newData = data.frame(matrix(unlist(lists), nrow=length(lists), byrow=T),stringsAsFactors=FALSE);
colnames(newData) = names(lists[[1]]);



# type casting
newData$winner = factor(newData$winner);
newData$home_goals = as.numeric(newData$home_goals);
newData$away_goals = as.numeric(newData$away_goals);
newData$id = as.numeric(newData$id);
newData$league_id = as.numeric(newData$league_id);

for (type in c("home", "away")) {
  gk_key = sprintf("%s_gk", type);
  def_key = sprintf("%s_def", type);
  mid_key = sprintf("%s_mid", type);
  atk_key = sprintf("%s_atk", type);
  
  for (key in c(gk_key, def_key, mid_key, atk_key)) {
    newData[[key]] = as.numeric(newData[[key]]);
  }
  newData[[sprintf("%s_count", def_key)]] = as.numeric(newData[[sprintf("%s_count", def_key)]]);
  newData[[sprintf("%s_count", mid_key)]] = as.numeric(newData[[sprintf("%s_count", mid_key)]]);
  newData[[sprintf("%s_count", atk_key)]] = as.numeric(newData[[sprintf("%s_count", atk_key)]]);
}

# update overall-rating given players per role count
# for (type in c("home", "away")) {
#   for (role in c("def", "mid", "atk")) {
#     newData[sprintf("%s_%s", type, role)] = round(apply(newData, 1, function(x) 
#       as.numeric(x[sprintf("%s_%s", type, role)]) + 
#         log(as.numeric(x[sprintf("%s_%s_count", type, role)]) / mean(newData[[sprintf("%s_%s_count", type, role)]]))*20));
#     # mean should be taken out of this loop
#   }
# }

# overall grouping
# newData$home_def_score <- with(newData, home_gk + home_def + home_mid);
# newData$home_atk_score <- with(newData, home_atk + home_mid);
# newData$away_def_score <- with(newData, away_gk + away_def + away_mid);
# newData$away_atk_score <- with(newData, away_atk + away_mid);



#plot_histogram(newData);
#plot_bar(newData);

# discretizaion intervals analysis (chosen empirically)
# arules::discretize(newData$home_gk, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$home_def, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$home_mid, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$home_atk, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$away_gk, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$away_def, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$away_mid, method = "frequency", breaks = 6, onlycuts = TRUE);
# arules::discretize(newData$away_atk, method = "frequency", breaks = 6, onlycuts = TRUE);



### FEATURE DISCRETIZATION

discr = data.frame(newData);

for (type in c("home", "away")) {
  gk_key = sprintf("%s_gk", type);
  def_key = sprintf("%s_def", type);
  mid_key = sprintf("%s_mid", type);
  atk_key = sprintf("%s_atk", type);
  
  for (key in c(gk_key, def_key, mid_key, atk_key)) {
    intervals = arules::discretize(discr[[key]], method = "frequency", breaks = 6, onlycuts = TRUE);
    cat("\nDiscretization intervals for ", key, ": ", intervals);
    
    discr[[key]] = 
      arules::discretize(discr[[key]],
                 method = "frequency", 
                 breaks = 6,
                   labels = c("terrible", "bad", "mediocre", "good", "very good", "excellent")
               );
  }
  
  # overall grouping
  # for (role in c("atk", "def")) {
  #   key = sprintf("%s_%s_score", type, role);
  #   discr[[key]] =
  #     arules::discretize(discr[[key]],
  #                method = "frequency",
  #                breaks = 6,
  #                labels = c("terrible", "bad", "mediocre", "good", "very good", "excellent")
  #             );
  # }
}

discr$home_goals = NULL;
discr$away_goals = NULL;
discr$id = NULL;
discr$league_id = NULL;
discr$away_def_count = NULL;
discr$away_mid_count = NULL;
discr$away_atk_count = NULL;

plot_bar(discr);
plot_histogram(discr);


### SAVING CSV
write.csv(discr, file = "dataset.csv",row.names=FALSE);
