ArtSlotApp = angular.module("ArtSlotApp", [
  "ArtSlotAppCtrls", "ProjectRouter", "ProjectsService"
])

ArtSlotAppCtrls = angular.module("ArtSlotAppCtrls", [])
ProjectRouter = angular.module("ProjectRouter", ["rgRoute"])
ProjectsService = angular.module("ProjectsService", ["ngResource"])
