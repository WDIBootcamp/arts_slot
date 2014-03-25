angular.module("artSlotAppCtrls")
  .controller("projectsCtrl", [
    "$scope", "$http", "projectRes", "$location", "$routeParams"
      ($scope, $http, projectRes, $location, $routeParams) ->

        # $scope.allProjects = []
        #
        # projectRes.query((data) ->
        #     console.log(data);
        #     $scope.allProjects = data;
        #     )

        $scope.createProject = ->
          $scope.project = {}
          project = new projectRes($scope.project)
          newProject = project.$save ->
              $location.path("/projects/"+project.id)

  ])
