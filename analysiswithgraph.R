acplot<-qplot(x=1:ncol(players.acscore),y=players.acscore[1,],xlab="Rounds",ylab="Accumulate Scores",geom="point")
acplot<-acplot+geom_line(y=players.acscore[4,],color='black')
acplot<-acplot+geom_point(y=players.acscore[5,],color='purple')
acplot<-acplot+geom_point(y=players.acscore[8,],color='green')
acplot<-acplot+geom_point(y=players.acscore[9,],color='grey')
acplot<-acplot+geom_point(y=players.acscore[11,],color='yellow')
acplot<-acplot+geom_point(y=players.acscore[13,],color='blue')
acplot<-acplot+geom_point(y=players.acscore[15,],color='orange')
acplot<-acplot+geom_point(y=players.acscore[17,],color='red')
acplot<-acplot+geom_point(y=players.acscore[20,],color='brown')
acplot<-acplot+geom_point(y=players.acscore[21,],color='cyan')
acplot<-acplot+geom_point(y=players.acscore[23,],color='cyan')
acplot

acplot<-qplot(x=1:ncol(players.acscore),y=players.acscore[11,],xlab="Rounds",ylab="Accumulate Scores",geom="point")
acplot<-acplot+geom_point(y=players.acscore[20,],color='red')
acplot<-acplot+geom_point(y=players.acscore[15,],color='blue')
acplot

TotalValuePerRound <-sum(players.data[,'ACS'])/players.allTime
TotalValuePerRound
TotalValuePerPlayer <-sum(players.data[,'ACS'])/players.size
TotalValuePerPlayer
TotalValuePerPlayerRound <-sum(players.data[,'ACS'])/players.allTime/players.size
TotalValuePerPlayerRound

AccumulateValueAvePlayer=0
for(i in 1:players.allTime){
  AccumulateValueAvePlayer[i]<-sum(players.acscore[,i])/players.size
}
acAveplot<-qplot(x=1:players.allTime,y=AccumulateValueAvePlayer,xlab="Rounds",ylab="Average Accumulate Scores",main="Accumulated Average Value per Player")
acAveplot<-acAveplot+geom_line(y=3*c(1:players.allTime),color="blue")
acAveplot<-acAveplot+geom_line(y=2.5*c(1:players.allTime),color="red")
acAveplot<-acAveplot+geom_line(y=c(1:players.allTime),color="yellow")
acAveplot

ValueAvePlayer=0
for(i in 1:players.allTime){
  ValueAvePlayer[i]<-sum(players.score[,i])/players.size
}
aveplot<-qplot(x=1:players.allTime,y=ValueAvePlayer,xlab="Rounds",ylab="Average Scores",geom="line",main="Average Value Per player of Each Round")
aveplot

p=20
MP=data.frame(N=as.character(1:players.size),M=0)
for(i in 1:players.size){
  if(i==p){next}
  MP[i,'M']=ave(as.numeric(game.scorelog[p,c(FALSE,(!is.na(game.scorelog[p,2:ncol(game.scorelog)]))&
                         (!is.na(game.scorelog[i,2:ncol(game.scorelog)])))]))[1]
}
reorder(MP$N,MP$M)
SingleAveplot<-qplot(x=N,y=M,data=MP,ylab="Average Scores",geom="bar",stat="identity",fill=N,main="typeStatThenStatCompetitorDoRand Average On Other")
SingleAveplot