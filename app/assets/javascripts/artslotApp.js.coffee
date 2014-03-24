artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls", "projectRouter", "projectsService", "charactersService"
])

  .config(["$httpProvider", ($httpProvider) ->
       $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])

artSlotAppCtrls = angular.module("artSlotAppCtrls", [])
projectRouter = angular.module("projectRouter", ["rgRoute"])
projectsService = angular.module("projectsService", ["ngResource"])
charactersService = angular.module("charactersService", ["ngResource"])





#=============================== routes


angular.module('projectRouter', [
  'ngRoute'
])

  .config(["$routeProvider",
    ($routeProvider) ->

      $routeProvider.when("/",
        templateUrl: "../templates/project.html"
        controller: "projectsCtrl"
      ).when("/projects",
        templateUrl: "/templates/all_projects.html"
        controller: "projectsCtrl"
      )
])
