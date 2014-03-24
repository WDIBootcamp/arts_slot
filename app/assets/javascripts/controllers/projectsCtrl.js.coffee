angular.module("artSlotAppCtrls")
  .controller("projectsCtrl", [
    "$scope", "$http", "projectRes"
      ($scope, $http, projectRes) ->

        $scope.allProjects = []

        projectRes.query((data) ->
            console.log(data);
            $scope.allProjects = data;
            )

        newProject = projectRes.save($scope.project)
        $scope.allProjects.push(newProject)
  ])
