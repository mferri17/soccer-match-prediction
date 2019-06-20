#install.packages("bnlearn")
#install.packages("RSQLite")
#install.packages("DataExplorer");
#install.packages("arules");
#install.packages("plyr");
#install.packages("GGally");

library("DataExplorer");
library("arules");
library("plyr");
library("GGally");
library(ggplot2);
library("arules");


#setwd("C:/Users/mbass/dev/modelli-progetto");
setwd("C:/Users/96mar/Desktop/Modelli Probabilistici");





#### PLAYER ATTRIBUTES ANALYSIS


PlayerAttributes <- read.csv(file="dataset/Player_Attributes.csv", header=TRUE, sep=",");
PlayerAttributes$id <- NULL;
PlayerAttributes$player_api_id <- NULL;
PlayerAttributes$player_fifa_api_id <- NULL;
PlayerAttributes$date <- NULL;




## Distributions
plot_bar(PlayerAttributes); #  discrete
plot_histogram(PlayerAttributes); # continuous





## Correlations for different player types


# total
plot_correlation(PlayerAttributes,
   type = "continuous",
   title = "Total correlation",
   cor_args = list("use" = "pairwise.complete.obs"))

# goal-keepers
plot_correlation(
  PlayerAttributes[PlayerAttributes$gk_diving > 40, ], 
  type = "continuous",
  title = "Overall-rating correlation for GK",
  cor_args = list("use" = "pairwise.complete.obs"));

# non goal-keepers
plot_correlation(
  PlayerAttributes[PlayerAttributes$gk_diving <= 40, ], 
  type = "continuous",
  title = "Overall-rating correlation for non-GK",
  cor_args = list("use" = "pairwise.complete.obs"));


# inverse correlation between finishing and marking in non-GK players...
cor(PlayerAttributes[PlayerAttributes$gk_diving <= 40, ]$marking, PlayerAttributes[PlayerAttributes$gk_diving <= 40, ]$finishing, use ="pairwise.complete.obs");

# ... then we can use these columns to distinguish approximately between Defenders and Attackers ...
# ... so we finally prove that overall-rating is enough to compute each team power for different players' role

# defenders
plot_correlation(
  PlayerAttributes[which(PlayerAttributes$marking > 50 & PlayerAttributes$finishing < 50 & PlayerAttributes$gk_diving < 50), ],
  type = "continuous",
  title = "Overall-rating correlation for DEFENDERS",
  cor_args = list("use" = "pairwise.complete.obs"));

# attackers
plot_correlation(
  PlayerAttributes[which(PlayerAttributes$marking < 50 & PlayerAttributes$finishing > 50 & PlayerAttributes$gk_diving < 50), ],
  type = "continuous",
  title = "Overall-rating correlation for ATTACKERS",
  cor_args = list("use" = "pairwise.complete.obs"));


# test which plot just the overall-rating row for the correlation matrix
# plot_correlation(
#   PlayerAttributes[which(PlayerAttributes$sliding_tackle < 30 & PlayerAttributes$gk_diving < 50), ],
#   type = "continuous",
#   title = "Correlation for ATTACKERS",
#   cor_args = list(
#     "use" = "pairwise.complete.obs"
#     #"y" = PlayerAttributes[which(PlayerAttributes$sliding_tackle < 30 & PlayerAttributes$gk_diving < 50), "overall_rating"]
#   ));




#### PLAYER ATTRIBUTES DISCRETIZATION

plot_histogram(PlayerAttributes$overall_rating);

discretize(PlayerAttributes$overall_rating, 
           method = "frequency", 
           breaks = 5);




