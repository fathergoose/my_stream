myStream = angular.module('myStream',[]).controller('PlayCtrl', function($scope,$http){
  var player, nowPlaying = 0;

  $scope.playingList = []

  $scope.setup = function() {
    $http.get('albums.json').then(function(response) {
      $scope.albums = response.data;
      console.log(response);
    });
  };


  if($scope.playingList.length != 0){
  $scope.audio = ngAudio.load($scope.playingList[nowPlaying].url);
  }

  $scope.start = function() {
    $scope.audio.play();
  };



  $scope.next = function(){
    nowPlaying = nowPlaying + 1;
  };

  $scope.add = function(track) {
    if($scope.playingList.length === 0) {
      $scope.audio = track.url;
      $scope.playingList.push(track);
    } else {
      $scope.playingList.push(track);
    }
  };




  window.scope = $scope
});
