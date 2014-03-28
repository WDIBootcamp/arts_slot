angular.module("artSlotAppCtrls")
  .controller("usersCtrl", [
    "$scope", "userRes", "$location", "$routeParams", "$http"
      ($scope, userRes, $location, $routeParams, $http) ->

        $scope.users = []

        userRes.query((data) ->
          console.log(data);
          $scope.users = $scope.users.concat(data);
          )

        $http.get("/users/"+$routeParams.id+".json").
          success((data) ->
            console.log(data);
            $scope.user = data;
          )

        $scope.pId = $routeParams.p
        # $scope.pName = pId.name
        $scope.cId = $routeParams.c




  ])
