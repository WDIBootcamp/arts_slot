angular.module("artSlotAppCtrls")
  .controller("projectsCtrl", [
    "$scope", "$http", "projectRes"
      ($scope, $http, projectRes) ->

        $scope.allProjects = []

        # $http.get("/projects.json").
        #     success((data) ->
        #         console.log(data)
        #         $scope.allProjects = data
        #     )

        projectRes.query((data) ->
            console.log(data);
            $scope.allProjects = data;
            )
  ])
