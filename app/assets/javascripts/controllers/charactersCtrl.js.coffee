angular.module("artSlotAppCtrls")
  .controller("charactersCtrl", [
    "$scope", "$http", "characterRes", "$routeParams"
      ($scope, $http, characterRes, $routeParams) ->

        $scope.projectId = $routeParams.id

        $scope.characters = characterRes.query(project_id: $scope.projectId)

        # $scope.newCharacter = ->
        #   $scope.character = {}
        #   character = new projectRes($scope.project)
        #   newProject = project.$save ->

        $scope.saveCharacter = ->
          character = new characterRes($scope.character)
          newCharacter = character.$save ((response)->
              #add the response to the characters' array
              $scope.characters.push(response);

          #empty the character's form on the view
          $scope.character = {}
          )

        # $scope.gender = [
        #   {name: "male"}
        #   {name: "female"}
        # ]

  ])
