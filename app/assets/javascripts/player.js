/* global angular,  window */

var myStream = angular.module('myStream', ['ngAnimate']);
// var scope = angular.element(document.getElementById('PlayCtrl')).scope();
var jPlayerPlaylist;

/* Library Functions */

myStream.controller('PlayCtrl', function($scope, $http) {
  $scope.setup = function() {
    $http.get('albums.json').then(function(response) {
      $scope.albums = response.data;
      console.log(response);
    });
    $scope.showing = 'albums';
  };

  $scope.getArtists = function() {
    $http.get('artists.json').then(function(response) {
      $scope.artists = response.data;
      console.log(response, $scope.artists);
    });
  };

  $scope.getTracks = function() {
    $http.get('tracks.json').then(function(response) {
      $scope.tracks = response.data;
      console.log(response, $scope.tracks);
    });
  };

  $scope.getPlaylists = function() {
    $http.get('playlists.json').then(function(response) {
      $scope.playlists = response.data;
      console.log(response, $scope.playlists);
    });
  };

  $scope.changeView = function(view) {
    console.log(view);
    switch (view) {
      case 'artists':
        $scope.getArtists();
        $scope.showing = 'artists';
        break;
      case 'tracks':
        $scope.getTracks();
        $scope.showing = 'tracks';
        break;
      case 'playlists':
        $scope.getPlaylists();
        $scope.showing = 'playlists';
        break;
      default:
        $scope.setup();
    }
  };

/* Playlists Functions */

  $scope.playingList = [];

  $scope.$watch(function() {
    return jPlayerPlaylist.playlist;
  }, function(playlist) {
    $scope.nowPlayingList = playlist;
  }
);

  $scope.add = function(track) {
    console.log(track.title);
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

  window.scope = $scope;
});
