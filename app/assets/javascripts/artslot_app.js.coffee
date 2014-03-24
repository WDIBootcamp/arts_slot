artSlotApp = angular.module("artSlotApp", [
  "artSlotAppCtrls", "projectRouter", "projectsService"
])

artSlotAppCtrls = angular.module("artSlotAppCtrls", [])
projectRouter = angular.module("projectRouter", ["rgRoute"])
projectsService = angular.module("projectsService", ["ngResource"])
