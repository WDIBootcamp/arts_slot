angular.module("artSlotAppCtrls")
  .controller("charactersCtrl", [
    "$scope", "$http", "characterRes", "$routeParams"
      ($scope, $http, characterRes, $routeParams) ->

        characterRes.query({project_id: $routeParams.id}, (data)->
            $scope.characters = data;
        )

        $scope.saveCharacter = ->
          $scope.character.project_id = $routeParams.id
          characterRes.save($scope.character, (response)->
              #add the response to the characters' array
              $scope.characters.push(response);

          $scope.suggestions = $scope.suggestActors(
            $routeParams.id
            $scope.character.id
          )

          #empty the character's form on the view
          $scope.character = {}

          )

        # $scope.gender = [
        #   {name: "male"}
        #   {name: "female"}
        # ]

        $scope.suggestActors = (project_id, character_id)->



  ])
