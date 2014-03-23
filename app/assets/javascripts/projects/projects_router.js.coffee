angular.module('ProjectRouter', [
  'ngRoute'
])

  .config(["$routeProvider",
    ($routeProvider) ->

      $routeProvider.when("/",
        templateUrl: "/projects"
        controller: "ProjectsCtrl"
      )
])
