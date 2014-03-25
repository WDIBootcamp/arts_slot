angular.module("artSlotAppCtrls")
  .controller("usersCtrl", [
    "$scope", "$http", "userRes", "$location", "$routeParams"
      ($scope, $http, userRes, $location, $routeParams) ->

        $scope.users = []

        userRes.query((data) ->
          console.log(data);
          $scope.users = $scope.users.concat(data);
          )

        $http({
          method: "get",
          url: "/users.json",
          data: $scope.user,
          headers: {
            'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
          }
        })

  ])
