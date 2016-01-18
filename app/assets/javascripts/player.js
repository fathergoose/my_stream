/* global angular,  window */

var myStream = angular.module('myStream', ['ngAnimate']);
// var scope = angular.element(document.getElementById('PlayCtrl')).scope();
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
    if ((/\.(flac)$/i).test(track.url)) {
      jPlayerPlaylist.add({
        title: track.title,
        flac: track.url
      });
    } else if ((/\.(mp3)$/i).test(track.url)) {
      jPlayerPlaylist.add({
        title: track.title,
        mp3: track.url
      });
    } else {
      // returns error
    }

    console.log($scope.nowPlayingList, jPlayerPlaylist.playlist);
  };

  $scope.remove = function(index) {
    console.log(index);
    console.log(jPlayerPlaylist.remove(index));
  };

  $scope.toggleExpand = function(album) {
    album.expanded = !album.expanded;
  };
  $scope.getToggleIcon = function(album) {
    if (album.expanded) {
      return 'fa fa-shevron-right';
    } else { // eslint no-else-return=1
      return 'fa fa-shevron-down';
    }
  };

  window.scope = $scope;
});
