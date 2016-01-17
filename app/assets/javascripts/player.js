/* global angular,  window, document, $ */

var myStream = angular.module('myStream', []);
// var scope = angular.element(document.getElementById('PlayCtrl')).scope();
var nowPlayingList;
var jPlayerPlaylist;

myStream.controller('PlayCtrl', function($scope, $http) {
  $scope.setup = function() {
    $http.get('albums.json').then(function(response) {
      $scope.albums = response.data;
      console.log(response);
    });
  };

  $scope.playingList = [];

  $scope.$watch(function() {
    return jPlayerPlaylist.playlist;
  }, function(playlist) {
    $scope.nowPlayingList = playlist;
  }
);

  $scope.add = function(track) {
    console.log('heYYYYYYYYYYYESSSSSSSS!!!!!@', track.title);
    jPlayerPlaylist.add({
      title: track.title,
      mp3: track.url
    }
    );
    console.log($scope.nowPlayingList, jPlayerPlaylist.playlist);
  };

  $scope.remove = function(index) {
    console.log(index);
    console.log(jPlayerPlaylist.remove(index));
  };

  window.scope = $scope;
});
