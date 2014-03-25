angular.module("artSlotAppCtrls")
  .controller("usersCtrl", [
    "$scope", "$http", "userRes", "$location", "$routeParams"
      ($scope, $http, userRes, $location, $routeParams) ->

        $scope.allUsers = []

        userRes.query((data) ->
          console.log(data);
          $scope.allUsers = $scope.allUsers.concat(data);
          )

        # projectRes.query((data) ->
        #     console.log(data);
        #     $scope.allProjects = data;
        #     )

        # $scope.createProject = ->
        #   $scope.project = {}
        #   project = new projectRes($scope.project)
        #   newProject = project.$save ->
        #       $location.path("/projects/"+project.id)
        #
        # $scope.updateProject = ->
        #   console.log $scope.project
        #   $scope.project.id = $routeParams.id
        #
        #   console.log  projectRes.update($scope.project)


  ])
