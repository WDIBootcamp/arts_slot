
artSlotAppCtrls.controller("projectsCtrl", [
  "$scope", "$http", "ProjectRes"
    ($scope, $http, ProjectRes) ->

      $scope.allProjects = []

      # $http.get("/projects.json").
      #     success((data) ->
      #         console.log(data)
      #         $scope.allProjects = data
      #     )

      ProjectRes.query((data) ->
          console.log(data);
          $scope.allProjects = data;
          )
])
