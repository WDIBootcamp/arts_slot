artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls", "projectRouter", "projectsService"
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

      $routeProvider.when("/projects",
        templateUrl: "/projects"
        controller: "projectsCtrl"
      )
])
