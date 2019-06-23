# given a row, this function computes aN overall_rating role-based aggregation
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
    
    # computing average values
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