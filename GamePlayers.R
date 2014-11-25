players.size <- 16 #even
#players.eachTime <- 1
players.allTime <- 100

game.decisionlog<-data.frame(NO=1:players.size)
game.scorelog<-data.frame(NO=1:players.size)
source(file="DecisionStrategy.R")

# players.data <- data.frame(NO=1:players.size,
#                            NUM=0,
#                            ACS=0,
#                            DS=DecisionStrategy.name[round(runif(
#                              players.size,1,DecisionStrategy.size))])
cooperateAll <- matrix(data=1,nrow=1,ncol=2)
betrayAll <- matrix(data=2,nrow=1,ncol=2)
onceBetrayAlwaysBetray <- matrix(data=3,nrow=1,ncol=0)
twiceBetrayAlwaysBetray <- matrix(data=4,nrow=1,ncol=0)
threeTimesBetrayAlwaysBetray <- matrix(data=5,nrow=1,ncol=2)
cooperateThenDoCompetitorDo <- matrix(data=6,nrow=1,ncol=2)
typeStatThenDoCompetitorDo <- matrix(data=7,nrow=1,ncol=0)
typeStatThenStatCompetitorDo <- matrix(data=8,nrow=1,ncol=0)
typeStatThenStatCompetitorDoRand <- matrix(data=9,nrow=1,ncol=0)
typeStatThenStatCompetitorDoHighInfo <- matrix(data=10,nrow=1,ncol=4)
typeStatThenStatCompetitorDoRandHighInfo <- matrix(data=11,nrow=1,ncol=4)
typeStatThenStatCompetitorDoRandBad <- matrix(data=12,nrow=1,ncol=0)
typeStatThenStatCompetitorDoRandHighInfoBad <- matrix(data=13,nrow=1,ncol=0)
typeStatThenStatCompetitorDoRandBadFirst <- matrix(data=14,nrow=1,ncol=0)
cdplayers <- c(cooperateAll,betrayAll,onceBetrayAlwaysBetray,twiceBetrayAlwaysBetray,
               threeTimesBetrayAlwaysBetray,cooperateThenDoCompetitorDo,typeStatThenDoCompetitorDo,
               typeStatThenStatCompetitorDo,typeStatThenStatCompetitorDoRand,
               typeStatThenStatCompetitorDoHighInfo,typeStatThenStatCompetitorDoRandHighInfo,
               typeStatThenStatCompetitorDoRandBad,typeStatThenStatCompetitorDoRandHighInfoBad,
               typeStatThenStatCompetitorDoRandBadFirst)
players.data <- data.frame(NO=1:players.size,
                           NUM=0,
                           ACS=0,
                           A_NUM=0,
                           A_SUCCESS=0,
                           B_NUM=0,
                           B_SUCCESS=0,
                           DS=DecisionStrategy.name[cdplayers])
players.score <- matrix(data=0,nrow=players.size,ncol=players.allTime)
players.acscore <- matrix(data=0,nrow=players.size,ncol=players.allTime)
#TRUE,FALSE
Players.checkExist<-function(){
  any(players.data[,'NUM']!=players.allTime)
}
Players.checkTimesExist<-function(times){
  any(players.data[,'NUM']==times)
}
Players.checkSingleExist<-function(rowno){
  players.data[rowno,'NUM']!=players.allTime
}
Players.ExistList<-function(){
  players.data[,'NUM']!=players.allTime
}