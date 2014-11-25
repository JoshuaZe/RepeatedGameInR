
i.onlySelfInfoWithCompetitor<-function(p.NO,c.NO){
  info=t(data.frame(
    c=t(game.decisionlog[c.NO,(!is.na(game.decisionlog[p.NO,1:ncol(game.decisionlog)]))&
                              (!is.na(game.decisionlog[c.NO,1:ncol(game.decisionlog)]))])))
}

i.onlySelfInfoAboutTypeOfCompetitor<-function(p.NO){
  e.info <- data.frame(data=0)
  for(i in 1:players.size){
      c=t(game.decisionlog[i,(!is.na(game.decisionlog[p.NO,1:ncol(game.decisionlog)]))&
                             (!is.na(game.decisionlog[i,1:ncol(game.decisionlog)]))])
      e.info[i]=c[2]
  }
  e.info
}

i.allInfoAboutCompetitor<-function(c.NO){
  info=t(data.frame(
    c=t(game.decisionlog[c.NO,(!is.na(game.decisionlog[c.NO,1:ncol(game.decisionlog)]))])))
}