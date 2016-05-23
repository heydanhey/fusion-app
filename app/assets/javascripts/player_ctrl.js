(function() {
  "use strict";

  angular.module("app").controller("playerCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile)
    {
      window.scope = $scope;

      $scope.setup = function(){

        $http.get('/api/v1/players.json').then(function(response){
          $scope.players = response.data;

          $scope.QBs = [];
          $scope.RBs = [];
          $scope.WRs = [];
          $scope.TEs = [];
          $scope.Ks = [];
          $scope.Ds = [];
          $scope.activeTeamList = [];

          for (var i=0; i<$scope.players.length; i++){
            if ($scope.players[i].position == "QB"){
              $scope.QBs.push($scope.players[i]);
            } else if ($scope.players[i].position == "RB"){
              $scope.RBs.push($scope.players[i]);
            } else if ($scope.players[i].position == "WR"){
              $scope.WRs.push($scope.players[i]);
            } else if ($scope.players[i].position == "TE"){
              $scope.TEs.push($scope.players[i]);
            } else if ($scope.players[i].position == "K"){
              $scope.Ks.push($scope.players[i]);
            } else if ($scope.players[i].position == "D"){
              $scope.Ds.push($scope.players[i]);
            };            
          };

          $scope.rosteredQBs = [{}, {}];
          $scope.rosteredRBs = [{}, {}, {}];
          $scope.rosteredWRs = [{}, {}, {}];

      });

      $scope.updateTeamList = function(team){
        if (team in $scope.activeTeamList) {
          return true;
        } else {
          $scope.activeTeamList.push(team);
          return false;
        };
      }; 

      $scope.isDisabled = function(player, rosteredPlayer, rosteredPlayers) {

        if (rosteredPlayer.team) {
          $scope.updateTeamList(rosteredPlayer.team);
          return false;
        } else {

          return (rosteredPlayers.indexOf((player)) !== -1 && rosteredPlayers.indexOf((player)) != rosteredPlayers.indexOf(rosteredPlayer))
        }
      }; 


    };


  }]);
 
}());