artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls"
  "projectRouter", "projectsService",
  "charactersService"
  "userRouter", "usersService"
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
      $routeProvider.when("/projects/:id",
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
      ).when('/',
        templateUrl: '../templates/registration/sign_up.html'
        controller: 'loginCtrl'
      ).when('/login',
        templateUrl: '../templates/registration/login.html'
        controller: 'loginCtrl'
      ).when('/users/:id/edit'
        templateUrl: '../templates/edit_user.html'
        controller: 'usersCtrl'
      )
])
