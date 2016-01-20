/* global angular,  window, $ */

var myStream = angular.module('myStream', ['ngAnimate']);
var jPlayerPlaylist;

/* Library Functions */

myStream.controller('PlayCtrl', function($scope, $http) {
  $scope.setup = function() {
    $scope.getAlbums();
    $scope.showing = 'albums';
    $scope.homeView = 'home';
  };

  $scope.getAlbums = function() {
    $http.get('albums.json').then(function(response) {
      $scope.albums = response.data;
      console.log(response, $scope.albums);
    });
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
        $scope.getAlbums();
        $scope.showing = 'albums';
    }
  };

  $scope.changeHomeView = function(view) {
    $scope.homeView = view;
  };

  $scope.sortBy = function(sortAttribute) {
    console.log(sortAttribute);
    $scope.sortAttribute = sortAttribute;
    $scope.sortDescending = !$scope.sortDescending;
  };

/* Playlists Functions */

  $scope.$watch(function() {
    return jPlayerPlaylist.playlist;
  }, function(playlist) {
    $scope.nowPlayingList = playlist;
  }
);

  var successNotification = function(newPlaylist) {
    $.gritter.add({
      title: 'Success',
      text: 'Your playlist <strong>' + newPlaylist.name +
      '</strong> was successfully saved'
    });
  };

  var errorNotification = function(error) {
    $.gritter.add({
      title: 'Error!',
      text: 'Status <strong>' + error.status + '</strong> returned.' +
      'Your playlist was unable to be saved, be sure you included songs'
    });
  };

  $scope.getCurrent = function(mode) {
    switch (mode) {
      case 'play':
        jPlayerPlaylist.play();
        break;
      case 'pause':
        jPlayerPlaylist.pause();
        break;
      case 'next':
        jPlayerPlaylist.next();
        break;
      case 'previous':
        jPlayerPlaylist.previous();
        break;
      case 'shuffle':
        jPlayerPlaylist.shuffle();
        break;
      default:
        return false;
    }
    console.log(jPlayerPlaylist.current);
    $scope.current = jPlayerPlaylist.current;
  };

  $scope.add = function(track) {
    console.log(track);
    if ((/\.(flac)$/i).test(track.url)) {
      jPlayerPlaylist.add({
        title: track.title,
        flac: track.url,
        id: track.id
      });
    } else if ((/\.(mp3)$/i).test(track.url)) {
      jPlayerPlaylist.add({
        title: track.title,
        mp3: track.url,
        id: track.id
      });
    } else {
      $scope.errors.push(
        'This file format is currently unsupported'
    );
    }
    console.log($scope.nowPlayingList, jPlayerPlaylist.playlist);
  };

  $scope.addMultiple = function(tracks) {
    console.log(tracks);
    for (var i = 0; i < tracks.length; i++) {
      jPlayerPlaylist.add({
        title: tracks[i].title,
        mp3: tracks[i].url,
        id: tracks[i].id
      });
    }
  };

  $scope.remove = function(index) {
    console.log(index);
    console.log(jPlayerPlaylist.remove(index));
  };

  $scope.savePlaylist = function(playlist) {
    console.log($scope.nowPlayingList);
    var newPlaylist = {
      name: playlist.name,
      notes: playlist.notes,
      tracks: playlist
    };
    $http.post('playlists', newPlaylist).then(function(response) {
      $scope.playlist = response.data;
      $scope.getPlaylists();
      successNotification(newPlaylist);
    }, function(error) {
      console.log(error, '##########');
      $scope.errors = error.data.errors;
      errorNotification(error);
    });
  };

  $scope.deletePlaylist = function(playlist) {
    $http.delete('/playlists/' + playlist.id).then(function(response) {
      console.log(response);
      var index = $scope.playlists.indexOf(playlist);
      $scope.playlists.splice(index, 1);
    }, function(error) {
      console.log(error);
    });
  };

  window.scope = $scope;
});
