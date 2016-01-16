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

$(document).ready(function() {
  nowPlayingList = window.scope.playingList;
  jPlayerPlaylist = new jPlayerPlaylist({ // eslint-disable-line
    jPlayer: '#jquery_jplayer_1',
    cssSelectorAncestor: '#jp_container_1'
  },
    nowPlayingList,
    {
      swfPath: '../../dist/jplayer',
      supplied: 'mp3',
      wmode: 'window',
      useStateClassSkin: true,
      autoBlur: false,
      smoothPlayBar: true,
      keyEnabled: true,
      playlistOptions: {
        enableRemoveControls: true,
        removeTime: 0
      }
    });
});
