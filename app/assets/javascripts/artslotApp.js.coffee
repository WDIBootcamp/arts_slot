artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls"
  "projectRouter", "projectsService",
  "charactersService", "characterRouter"
  "userRouter", "usersService"
])

  .config(["$httpProvider", ($httpProvider) ->
       $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])

artSlotAppCtrls = angular.module("artSlotAppCtrls", [])
projectRouter = angular.module("projectRouter", ["rgRoute"])
projectsService = angular.module("projectsService", ["ngResource"])
charactersService = angular.module("charactersService", ["ngResource"])
usersService = angular.module("usersService", ["ngResource"])
userRouter = angular.module("userRouter", ["rgRoute"])





#=============================== routes


angular.module('projectRouter', [
  'ngRoute'
])

  .config(["$routeProvider",
    ($routeProvider) ->


      $routeProvider.when("/",
        templateUrl: "../templates/start.html"
        controller: "projectsCtrl"
      ).when("/projects/:id",
        templateUrl: "../templates/project.html"
        controller: "projectsCtrl"
      ).when("/projects",
        templateUrl: "../templates/all_projects.html"
        controller: "projectsCtrl"
      )
])


angular.module('userRouter', [
  'ngRoute'
])

  .config(["$routeProvider",
    ($routeProvider) ->

      $routeProvider.when("/users",
        templateUrl: "../templates/all_users.html"
        controller: "usersCtrl"
      ).when("/users/:id",
        templateUrl: "../templates/user.html"
        controller: "usersCtrl"
      )

])


angular.module('characterRouter', [
  'ngRoute'
])
  .config(["$routeProvider",
    ($routeProvider) ->
      $routeProvider.when("/projects/:project_id/characters/:id",
        templateUrl: "../templates/character.html"
        controller: "characterDetailsCtrl"
      )
])
