artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls"
  "projectRouter", "projectsService",
  "charactersService", "characterRouter"
  "userRouter", "usersService"
  "authentication"
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
      ).when("/",
        templateUrl: "../templates/all_projects.html"
        controller: "projectsCtrl"
      ).when("/usersProjects",
        templateUrl: "../templates/project.html"
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
      ).when('/signup',
        templateUrl: '../templates/registration/sign_up.html'
        controller: 'loginCtrl'
      ).when('/login',
        templateUrl: '../templates/registration/login.html'
        controller: 'loginCtrl'
      ).when('/users/:id/edit'
        templateUrl: '../templates/edit_user.html'
        controller: 'usersCtrl'
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
        templateUrl: "../templates/character.html.erb"
        controller: "characterDetailsCtrl"
      )
  ])

angular.module('characterRouter', [
  'ngRoute'
])
  .config(["$routeProvider",
    ($routeProvider) ->
      $routeProvider.when("/projects/:project_id/characters/:id",
        templateUrl: "../templates/character.html.erb"
        controller: "characterDetailsCtrl"
      )
  ])
