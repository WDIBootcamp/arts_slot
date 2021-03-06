angular.module("artSlotAppCtrls")
  .controller("usersCtrl", [
    "$scope", "userRes", "$location", "$routeParams", "$http"
      ($scope, userRes, $location, $routeParams, $http) ->

        $scope.users = []

        $scope.pId = $routeParams.p
        $scope.cId = $routeParams.c

        userRes.query((data) ->
          $scope.users = $scope.users.concat(data);
          )

        $scope.updateUser = ->
          $scope.user.id = $routeParams.id
          userRes.update($scope.user)
          $location.path("/actorAdded!")


        if $routeParams.p
          $http.get("/users/"+$routeParams.id+".json").
            success((data) ->
              console.log(data);
              $scope.user = data;
            )

          $http.get("/projects/"+$scope.pId+".json").
            success((data) ->
              console.log(data);
              $scope.viaProject = data;
            )

          $http.get("/projects/"+$scope.pId+"/characters/"+$scope.cId+".json").
            success((data) ->
              console.log(data);
              $scope.asCharacter = data;
            )

  ])
