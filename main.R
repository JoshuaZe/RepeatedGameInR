source(file="GamePlayers.R")
source(file="GamePlatform.R")

for(times in 1:players.allTime){
  while(Players.checkTimesExist(times-1)){
    samplePlayers.NO=sample(players.data[players.data[,'NUM']==(times-1),]$NO, 2, replace = F)
    game.play(samplePlayers.NO[1], samplePlayers.NO[2],times)
  }
}

# while(Players.checkExist()){
#   if(length(which(Players.ExistList()))==1){break}
#   
#   for(player.NO in 1:players.size){
#     if(!Players.checkSingleExist(player.NO)){next}
#     if(length(which(players.data[,'NO']!=player.NO))==1){
#       samplePlayers.NO=players.data[Players.ExistList()&(players.data[,'NO']!=player.NO),]$NO
#     }else{
#       samplePlayers.NO=sample(players.data[
#         Players.ExistList()&(players.data[,'NO']!=player.NO),]$NO,
#                               players.eachTime, replace = T)
#     }
#     
#     for(p in 1:length(samplePlayers.NO)){
#       game.play(player.NO, samplePlayers.NO[p])
#     }
#   }
# }