(function() {
  "use strict";

  angular.module("app").controller("playerCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile)
    {
      window.scope = $scope;

      $scope.setup = function(){

        $http.get('/api/v1/players.json').then(function(response){
          $scope.players = response.data;

          $scope.roster = {
            qb_1: "",
            qb_2: ""
          };

          $scope.qb = [];
          $scope.rb = [];
          $scope.wr = [];
          $scope.te = [];
          $scope.k = [];
          $scope.d = [];

          for (var i=0; i<$scope.players.length; i++){
            $scope.players[i]["isSelected"] = false;
            if ($scope.players[i].position == "QB"){
              $scope.qb.push($scope.players[i]);
            } else if ($scope.players[i].position == "RB"){
              $scope.rb.push($scope.players[i]);
            } else if ($scope.players[i].position == "WR"){
              $scope.wr.push($scope.players[i]);
            } else if ($scope.players[i].position == "TE"){
              $scope.te.push($scope.players[i]);
            } else if ($scope.players[i].position == "K"){
              $scope.k.push($scope.players[i]);
            } else if ($scope.players[i].position == "D"){
              $scope.d.push($scope.players[i]);
            };            
          };


        });
      
    };


  }]);
 
}());