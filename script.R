#install.packages("bnlearn")
#install.packages("RSQLite")
#install.packages("DataExplorer");
#install.packages("arules");
#install.packages("plyr");
#install.packages("GGally");

library("RSQLite");
library("DataExplorer");
library("DataExplorer");
library("arules");
library("plyr");
library("GGally");

setwd("C:/Users/mbass/dev/soccer-match-prediction");
data = read.csv("dataset/FINAL.csv", header = TRUE);

# remove rows with NA inside
rows = !(is.na(data$home_team_goal)) & !(is.na(data$home_team_goal));
for (type in c("home", "away")) {
  for (i in 1:11) {
    rows = rows & !(is.na(data[[sprintf("%s%d_overall_rating", type, i)]])) & !(is.na(data[[sprintf("%s_player_Y%d", type, i)]]));
  }
}

data = data[rows, ];

mapRow = function(x) {
  home_goals = as.numeric(x["home_team_goal"]);
  away_goals = as.numeric(x["away_team_goal"]);
  
  if (home_goals > away_goals) {
    winner = "home";
  } else if (home_goals < away_goals) {
    winner = "away";
  } else {
    winner = "draw";
  }
  
  result = list();
  result["winner"] = winner;
  
  for (type in c("home", "away")) {
    gk_key = sprintf("%s_gk", type);
    def_key = sprintf("%s_def", type);
    mid_key = sprintf("%s_mid", type);
    atk_key = sprintf("%s_atk", type);

    keys = c(gk_key, def_key, mid_key, atk_key);
    count = c(0, 0, 0, 0);
    
    for (key in keys) {
      result[key] = 0;
    }
    
    for (i in 1:11) {
      overall = as.numeric(x[sprintf("%s%d_overall_rating", type, i)]);
      position = as.numeric(x[sprintf("%s_player_Y%d", type, i)]);
      
      if (position == 1) {
        count[1] = count[1] + 1;
        key = gk_key;
      } else if (position < 5) {
        count[2] = count[2] + 1;
        key = def_key;
      } else if (position < 9) {
        count[3] = count[3] + 1;
        key = mid_key;
      } else {
        count[4] = count[4] + 1;
        key = atk_key;
      }
      
      result[key] = as.numeric(result[key]) + overall;
    }
    
    i = 0;
    for (key in keys) {
      i = i + 1;
      result[key] = round(as.numeric(result[key]) / count[i]);
    }
    
  }

  result;
};

lists = apply(data, 1, mapRow);
newData = data.frame(matrix(unlist(lists), nrow=length(lists), byrow=T),stringsAsFactors=FALSE);
colnames(newData) = names(lists[[1]]);

newData$winner = factor(newData$winner);
for (type in c("home", "away")) {
  gk_key = sprintf("%s_gk", type);
  def_key = sprintf("%s_def", type);
  mid_key = sprintf("%s_mid", type);
  atk_key = sprintf("%s_atk", type);
  
  for (key in c(gk_key, def_key, mid_key, atk_key)) {
    newData[[key]] = as.numeric(newData[[key]]);
  }
}
