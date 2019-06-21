#install.packages("bnlearn")
#install.packages("RSQLite")
#install.packages("DataExplorer");
#install.packages("arules");
#install.packages("plyr");
#install.packages("GGally");

library("DataExplorer");
library("arules");

#setwd("C:/Users/mbass/dev/soccer-match-prediction/R-scripts");
setwd("C:/Users/96mar/Desktop/Modelli Probabilistici/R-scripts");
data = read.csv("../dataset/FINAL.csv", header = TRUE);

# remove rows with NA inside
rows = !(is.na(data$home_team_goal)) & !(is.na(data$away_team_goal));
for (type in c("home", "away")) {
  for (i in 1:11) {
    rows = rows & !(is.na(data[[sprintf("%s%d_overall_rating", type, i)]])) & !(is.na(data[[sprintf("%s_player_Y%d", type, i)]]));
  }
}

data = data[rows, ];


# given a row, this function computes a role-based aggregation for overall_rating
mapRow = function(x) {
  
  result = list(); # new row
  
  result["id"] = x["id"];
  result["league_id"] = x["league_id"];
  
  home_goals = as.numeric(x["home_team_goal"]);
  away_goals = as.numeric(x["away_team_goal"]);
  if (home_goals > away_goals) { winner = "home"; } 
  else if (home_goals < away_goals) { winner = "away"; }
  else { winner = "draw"; }
  
  result["home_goals"] = home_goals;
  result["away_goals"] = away_goals;
  result["winner"] = winner;
  
  
  for (type in c("home", "away")) {
    
    gk_key = sprintf("%s_gk", type);
    def_key = sprintf("%s_def", type);
    mid_key = sprintf("%s_mid", type);
    atk_key = sprintf("%s_atk", type);

    keys = c(gk_key, def_key, mid_key, atk_key);
    count = c(0, 0, 0, 0);
    
    for (key in keys) {
      result[key] = 0; # init
    }
    
    
    for (i in 1:11) { # players
      
      overall = as.numeric(x[sprintf("%s%d_overall_rating", type, i)]);
      position = as.numeric(x[sprintf("%s_player_Y%d", type, i)]);
      
      if (position == 1) { # goal keeper
        count[1] = count[1] + 1;
        key = gk_key;
      } else if (position <= 4) { # defenders
        count[2] = count[2] + 1;
        key = def_key;
      } else if (position <= 8) { # midders
        count[3] = count[3] + 1;
        key = mid_key;
      } else {  # attackers
        count[4] = count[4] + 1;
        key = atk_key;
      }
      
      result[key] = as.numeric(result[key]) + overall; # overall-ratings sum
    }
    
    # computing average overall-rating for roles
    i = 0;
    for (key in keys) {
      i = i + 1;
      result[key] = round(as.numeric(result[key]) / count[i]);
    }
    
    result[sprintf("%s_count", def_key)] = count[2]; # def counter
    result[sprintf("%s_count", mid_key)] = count[3]; # mid counter
    result[sprintf("%s_count", atk_key)] = count[4]; # atk counter
    
  }

  result;
};



# data frame transformation
lists = apply(data, 1, mapRow);
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
for (type in c("home", "away")) {
  for (role in c("def", "mid", "atk")) {
    newData[sprintf("%s_%s", type, role)] = round(apply(newData, 1, function(x) 
      as.numeric(x[sprintf("%s_%s", type, role)]) + 
        log(as.numeric(x[sprintf("%s_%s_count", type, role)]) / mean(newData[[sprintf("%s_%s_count", type, role)]]))*20));
    # mean should be taken out of this loop
  }
}

newData$home_def_score <- with(newData, home_gk + home_def + home_mid);
newData$home_atk_score <- with(newData, home_atk + home_mid);
newData$away_def_score <- with(newData, away_gk + away_def + away_mid);
newData$away_atk_score <- with(newData, away_atk + away_mid);


# discretizaion intervals analysis (chosen empirically)
#discretize(newData$home_gk, method = "frequency", breaks = 4);
#discretize(newData$home_def, method = "frequency", breaks = 4);
#discretize(newData$home_mid, method = "frequency", breaks = 4);
#discretize(newData$home_atk, method = "frequency", breaks = 4);
#discretize(newData$away_gk, method = "frequency", breaks = 4);
#discretize(newData$away_def, method = "frequency", breaks = 4);
#discretize(newData$away_mid, method = "frequency", breaks = 4);
#discretize(newData$away_atk, method = "frequency", breaks = 4);


### features discretization


discr = data.frame(newData);

for (type in c("home", "away")) {
  gk_key = sprintf("%s_gk", type);
  def_key = sprintf("%s_def", type);
  mid_key = sprintf("%s_mid", type);
  atk_key = sprintf("%s_atk", type);
  
  for (key in c(gk_key, def_key, mid_key, atk_key)) {
    discr[[key]] = discretize(discr[[key]], 
                                   method = "frequency", 
                                   breaks = 4, #c(-Inf, 68, 73, 76, Inf),
                                   labels = c("very bad", "bad", "good", "very good")
                                   );
  }
  
  
  for (role in c("atk", "def")) {
    key = sprintf("%s_%s_score", type, role);
    print(key);
    discr[[key]] = 
      discretize(discr[[key]], 
                 method = "frequency", 
                 breaks = 6);
  }
}

plot_bar(discr);
plot_histogram(discr);


# saving CSV

write.csv(discr, file = "dataset.csv",row.names=FALSE);




