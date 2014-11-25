game.decisionTable <- read.table(file="DT",sep=" ")
colnames(game.decisionTable) <- c("A","B")
rownames(game.decisionTable) <- c("A","B")

game.play<-function(p1.NO,p2.NO,times){
  p1.decision<-decision(strategy.name=as.character(players.data[p1.NO,"DS"]),p1.NO,p2.NO)
  p2.decision<-decision(strategy.name=as.character(players.data[p2.NO,"DS"]),p2.NO,p1.NO)
  #for p1 decision
  players.score[p1.NO,times]<<-game.decisionTable[p2.decision,p1.decision]
  #for p2 decision
  players.score[p2.NO,times]<<-game.decisionTable[p1.decision,p2.decision]
  
  players.data[p1.NO,"NUM"]<<-players.data[p1.NO,"NUM"]+1
  players.data[p1.NO,"ACS"]<<-players.data[p1.NO,"ACS"]+players.score[p1.NO,times]
  if(p1.decision=='A'){
    players.data[p1.NO,"A_NUM"]<<-players.data[p1.NO,"A_NUM"]+1
    if(p2.decision=='A'){
      players.data[p1.NO,"A_SUCCESS"]<<-players.data[p1.NO,"A_SUCCESS"]+1
    }
  }else{
    players.data[p1.NO,"B_NUM"]<<-players.data[p1.NO,"B_NUM"]+1
    if(p2.decision=='A'){
      players.data[p1.NO,"B_SUCCESS"]<<-players.data[p1.NO,"B_SUCCESS"]+1
    }
  }
  players.acscore[p1.NO,times]<<-players.data[p1.NO,"ACS"]
  
  players.data[p2.NO,"NUM"]<<-players.data[p2.NO,"NUM"]+1
  players.data[p2.NO,"ACS"]<<-players.data[p2.NO,"ACS"]+players.score[p2.NO,times]
  if(p2.decision=='A'){
    players.data[p2.NO,"A_NUM"]<<-players.data[p2.NO,"A_NUM"]+1
    if(p1.decision=='A'){
      players.data[p2.NO,"A_SUCCESS"]<<-players.data[p2.NO,"A_SUCCESS"]+1
    }
  }else{
    players.data[p2.NO,"B_NUM"]<<-players.data[p2.NO,"B_NUM"]+1
    if(p1.decision=='A'){
      players.data[p2.NO,"B_SUCCESS"]<<-players.data[p2.NO,"B_SUCCESS"]+1
    }
  }
  players.acscore[p2.NO,times]<<-players.data[p2.NO,"ACS"]
  
  recordCol<-ncol(game.decisionlog)+1
  game.decisionlog[p1.NO,recordCol] <<-p1.decision
  game.decisionlog[p2.NO,recordCol] <<-p2.decision
  game.scorelog[p1.NO,recordCol] <<- players.score[p1.NO,times]
  game.scorelog[p2.NO,recordCol] <<- players.score[p2.NO,times]
}