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


      //THIS FUNCTION JUST ITERATES THROUGH THE ROSTERS TO HELP GENERATE THE ACTIVE TEAM LIST
      $scope.addTeams = function(roster){
        for (var i=0; i<roster.length; i++){
          if (roster[i].team){
            $scope.activeTeamList.push(roster[i].team);
          }
        }
      }; 

      // THIS FUNCTION JUST KEEPS A LIST CURRENT OF THE TEAMS CURRENTLY SELECTED BY A USER
      $scope.updateTeamList = function(team){
        $scope.activeTeamList = [];
        $scope.addTeams(scope.rosteredQBs);
        $scope.addTeams(scope.rosteredRBs);
        $scope.addTeams(scope.rosteredWRs);
      };

      // maybe try doing normal angular filter with group by and disable for collction select?

      $scope.isDisabled = function(player, rosteredPlayer, rosteredPlayers) {

          // CALL FUNCTION TO ADD THE CURRENTLY SELECTED TEAM
          // THAT WAY  WE CAN DISABLE IF THAT TEAM IS ALREADY SELECTED

          if (rosteredPlayer.team) {
            $scope.updateTeamList(rosteredPlayer.team);
          }

          // THIS WILL RETURN TRUE IF EITHER THAT PLAYER OR HIS TEAM HAS ALREADY BEEEN SELECTED BY THE USER

          return (rosteredPlayers.indexOf((player)) !== -1 && rosteredPlayers.indexOf((player)) != rosteredPlayers.indexOf(rosteredPlayer)) || (rosteredPlayers.indexOf((player)) != rosteredPlayers.indexOf(rosteredPlayer) && $scope.activeTeamList.indexOf(player.team) != -1)
       
      }; 


    };


  }]);
 
}());