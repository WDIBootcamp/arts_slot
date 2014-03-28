angular.module("artSlotAppCtrls")
  .controller("usersCtrl", [
    "$scope", "userRes", "$location", "$routeParams"
      ($scope, userRes, $location, $routeParams) ->

        $scope.users = []

        userRes.query((data) ->
          $scope.users = $scope.users.concat(data);
          )

        $scope.updateUser = ->
          $scope.user.id = $routeParams.id
          userRes.update($scope.user)

        $scope.gender = ->
          

  ])
