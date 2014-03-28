angular.module("artSlotAppCtrls")
  .controller("usersCtrl", [
    "$scope", "userRes", "$location", "$routeParams"
      ($scope, userRes, $location, $routeParams) ->
        
        $scope.users = []

        userRes.query((data) ->
          console.log(data);
          $scope.users = $scope.users.concat(data);
          )

  ])
