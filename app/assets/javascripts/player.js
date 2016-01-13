myStream = angular.module('myStream',['ngAudio']).controller('PlayCtrl', function($scope,$http,ngAudio){
  var player, playingList = [], nowPlaying = 0;

  $scope.setup = function() {
    $http.get('albums.json').then(function(response) {
      $scope.albums = response.data;
      console.log(response);
    });
  };

  $scope.playingList = playingList;

  $scope.next = function(){
    nowPlaying = nowPlaying + 1;
  };
  $scope.add = function(track) {
    if(playingList.length === 0) {
      $scope.audio = ngAudio.load(track.url);
      playingList.push(track);
    } else {
      playingList.push(track);
    }
  };

  $scope.play = function(playingList, nowPlaying) {
    $scope.audio = ngAudio.play(playingList[nowPlaying].src);
  }


  // it is clear to me that this will need to be two seperate things
  // first there is the player and playingList
  // second is the library which serves to interact with the api
  // when the library template lists all tracks and albums I need buttons to call nowPlaying.add()
});
