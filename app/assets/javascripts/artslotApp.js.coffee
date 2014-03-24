artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls", "projectRouter", "projectsService"
])

  .config(["$httpProvider", ($httpProvider) ->
       $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])

artSlotAppCtrls = angular.module("artSlotAppCtrls", [])
projectRouter = angular.module("projectRouter", ["rgRoute"])
projectsService = angular.module("projectsService", ["ngResource"])




#=============================== routes


angular.module('projectRouter', [
  'ngRoute'
])

  .config(["$routeProvider",
    ($routeProvider) ->

      $routeProvider.when("/",
        templateUrl: "/projects/new"
        controller: "projectsCtrl"
      ).when("/projects",
        templateUrl: "/projects"
        controller: "projectsCtrl"
      )
])
