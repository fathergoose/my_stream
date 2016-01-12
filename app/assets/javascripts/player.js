var myStream = angular.module('myStream',['ngAudio']);
myStream.controller("playCtrl",function($scope,$http,ngAudio){
  var playingList = [];
  playingList = [
    {
      title: "Believe",
      src: "/uploads/track/path/11/02_-_Believe.mp3"
    }
  ];
  nowPlaying = 0;
      
  $scope.audio = ngAudio.load(playingList[nowPlaying].src);
  $scope.playingList = playingList;
  $scope.next = function(){
    nowPlaying = nowPlaying + 1;
  };
  $scope.add = function(track) {
    playingList.push(track);
  };
  // it is clear to me that this will need to be two seperate things
  // first there is the player and playingList
  // second is the library which serves to interact with the api
  // when the library template lists all tracks and albums I need buttons to call nowPlaying.add()
})
