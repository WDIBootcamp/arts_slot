angular.module('projectRouter', [
  'ngRoute'
])

  .config(["$routeProvider",
    ($routeProvider) ->

      $routeProvider.when("/",
        templateUrl: "/projects"
        controller: "ProjectsCtrl"
      )
])
