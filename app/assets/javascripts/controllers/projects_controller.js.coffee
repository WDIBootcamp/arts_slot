
angular.module("ArtSlotAppCtrls").controller("ProjectsCtrl", [
  "$scope", "$http"
    ($scope, $http) ->

      $scope.allProjects = []

      $http.get("/projects.json").
          success((data) ->
              console.log(data)
              $scope.allProjects = data
          )

])
