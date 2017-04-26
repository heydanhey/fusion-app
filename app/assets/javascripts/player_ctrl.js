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
          $scope.FLEXs = [];
          $scope.activeTeamList = [];
          $scope.activeRoster = [];

          for (var i=0; i<$scope.players.length; i++){
            if ($scope.players[i].position == "QB"){
              $scope.QBs.push($scope.players[i]);
            } else if ($scope.players[i].position == "RB"){
              $scope.RBs.push($scope.players[i]);
              $scope.FLEXs.push($scope.players[i]);
            } else if ($scope.players[i].position == "WR"){
              $scope.WRs.push($scope.players[i]);
              $scope.FLEXs.push($scope.players[i]);
            } else if ($scope.players[i].position == "TE"){
              $scope.TEs.push($scope.players[i]);
              $scope.FLEXs.push($scope.players[i]);
            } else if ($scope.players[i].position == "K"){
              $scope.Ks.push($scope.players[i]);
            } else if ($scope.players[i].position == "D"){
              $scope.Ds.push($scope.players[i]);
            };            
          };

          $scope.rosteredQBs = [{}, {}];
          $scope.rosteredRBs = [{}, {}, {}];
          $scope.rosteredWRs = [{}, {}, {}];
          $scope.rosteredTEs = [{}];
          $scope.rosteredKs = [{}, {}];
          $scope.rosteredDs = [{}];
          $scope.rosteredFLEXs = [{}];

      });


      //THIS FUNCTION JUST ITERATES THROUGH THE ROSTERS TO HELP GENERATE THE ACTIVE TEAM LIST
      $scope.addTeams = function(roster){
        for (var i=0; i<roster.length; i++){
          if (roster[i].team){
            $scope.activeTeamList.push(roster[i].team);
            $scope.activeRoster.push(roster[i].name);
          }
        }
      }; 

      // THIS FUNCTION JUST KEEPS A LIST CURRENT OF THE TEAMS CURRENTLY SELECTED BY A USER
      $scope.updateTeamList = function(team){
        $scope.activeTeamList = [];
        $scope.activeRoster = [];
        $scope.addTeams($scope.rosteredQBs);
        $scope.addTeams($scope.rosteredRBs);
        $scope.addTeams($scope.rosteredWRs);
        $scope.addTeams($scope.rosteredTEs);
        $scope.addTeams($scope.rosteredKs);
        $scope.addTeams($scope.rosteredDs);
        $scope.addTeams($scope.rosteredFLEXs);
      };

      // maybe try doing normal angular filter with group by and disable for collction select?

      $scope.isDisabled = function(player, rosteredPlayer, rosteredPlayers) {

          // CALL FUNCTION TO ADD THE CURRENTLY SELECTED TEAM
          // THAT WAY  WE CAN DISABLE IF THAT TEAM IS ALREADY SELECTED
          if (rosteredPlayer) {
            $scope.updateTeamList(rosteredPlayer);
          }

          // THIS WILL RETURN TRUE IF EITHER THAT PLAYER OR HIS TEAM HAS ALREADY BEEEN SELECTED BY THE USER
          return (rosteredPlayers.indexOf((player)) !== -1 && rosteredPlayers.indexOf((player)) != rosteredPlayers.indexOf(rosteredPlayer)) || (rosteredPlayers.indexOf((player)) != rosteredPlayers.indexOf(rosteredPlayer) && $scope.activeTeamList.indexOf(player.team) != -1 && $scope.activeRoster.includes(player.name))
      };

      $scope.isDisabledFlex = function (player, rosteredPlayer, rosteredPlayers) {
        if (rosteredPlayer) {
            $scope.updateTeamList(rosteredPlayer);
        }
        return $scope.activeRoster.includes(player.name)
      } 

      $scope.submit = function(team_name){

        var newRoster = {
          team_name: team_name,
          qb_1: $scope.rosteredQBs[0].id,
          qb_2: $scope.rosteredQBs[1].id,
          rb_1: $scope.rosteredRBs[0].id,
          rb_2: $scope.rosteredRBs[1].id,
          rb_3: $scope.rosteredRBs[2].id,
          wr_1: $scope.rosteredWRs[0].id,
          wr_2: $scope.rosteredWRs[1].id,
          wr_3: $scope.rosteredWRs[2].id,
          te_1: $scope.rosteredTEs[0].id,
          k_1: $scope.rosteredKs[0].id,
          k_2: $scope.rosteredKs[1].id,
          d_1: $scope.rosteredDs[0].id,
          flex_1: $scope.rosteredFLEXs[0].id
        };
        console.log(newRoster);

        $http.post('/api/v1/rosters.json', newRoster).then(function(response){
          console.log(response.data);
        });
        
      };

    };

  }]);
 
}());