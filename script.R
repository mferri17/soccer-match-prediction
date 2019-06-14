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

setwd("C:/Users/mbass/dev/modelli-progetto");
con <- dbConnect(drv=RSQLite::SQLite(), dbname="dataset/database.sqlite");

tables <- dbListTables(con);

lDataFrames <- vector("list", length=length(tables));
for (i in seq(along=tables)) {
  lDataFrames[[i]] <- dbGetQuery(conn=con, statement=paste("SELECT * FROM '", tables[[i]], "'", sep=""));
}

dbDisconnect(con);

# missing values analysis
print(introduce(lDataFrames[[5]]));
plot_missing(lDataFrames[[5]]);
plot_intro(lDataFrames[[5]]);

lDataFrames[[3]]$home_player_X1 = factor(lDataFrames[[3]]$home_player_X1);
lDataFrames[[3]]$home_player_Y1 = factor(lDataFrames[[3]]$home_player_Y1);
lDataFrames[[3]]$home_player_X2 = factor(lDataFrames[[3]]$home_player_X2);
lDataFrames[[3]]$home_player_Y2 = factor(lDataFrames[[3]]$home_player_Y2);
lDataFrames[[3]]$home_player_X3 = factor(lDataFrames[[3]]$home_player_X3);
lDataFrames[[3]]$home_player_Y3 = factor(lDataFrames[[3]]$home_player_Y3);
lDataFrames[[3]]$home_player_X4 = factor(lDataFrames[[3]]$home_player_X4);
lDataFrames[[3]]$home_player_Y4 = factor(lDataFrames[[3]]$home_player_Y4);
lDataFrames[[3]]$home_player_X5 = factor(lDataFrames[[3]]$home_player_X5);
lDataFrames[[3]]$home_player_Y5 = factor(lDataFrames[[3]]$home_player_Y5);
lDataFrames[[3]]$home_player_X6 = factor(lDataFrames[[3]]$home_player_X6);
lDataFrames[[3]]$home_player_Y6 = factor(lDataFrames[[3]]$home_player_Y6);
lDataFrames[[3]]$home_player_X7 = factor(lDataFrames[[3]]$home_player_X7);
lDataFrames[[3]]$home_player_Y7 = factor(lDataFrames[[3]]$home_player_Y7);
lDataFrames[[3]]$home_player_X8 = factor(lDataFrames[[3]]$home_player_X8);
lDataFrames[[3]]$home_player_Y8 = factor(lDataFrames[[3]]$home_player_Y8);
lDataFrames[[3]]$home_player_X9 = factor(lDataFrames[[3]]$home_player_X9);
lDataFrames[[3]]$home_player_Y9 = factor(lDataFrames[[3]]$home_player_Y9);
lDataFrames[[3]]$home_player_X10 = factor(lDataFrames[[3]]$home_player_X10);
lDataFrames[[3]]$home_player_Y10 = factor(lDataFrames[[3]]$home_player_Y10);
lDataFrames[[3]]$home_player_X11 = factor(lDataFrames[[3]]$home_player_X11);
lDataFrames[[3]]$home_player_Y11 = factor(lDataFrames[[3]]$home_player_Y11);
plot_bar(lDataFrames[[3]]);

#plot_histogram(lDataFrames[[5]]);
#ggcorr(lDataFrames[[5]]);

#discretized = discretize(lDataFrames[[5]]$overall_rating, method = "frequency", breaks = 6);
#discretized = revalue(discretized, c("[33,62)"="[0,62)", "[75,94]"="[75,100]"));

#print(levels(discretized));

