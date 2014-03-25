angular.module("artSlotAppCtrls")
  .controller("charactersCtrl", [
    "$scope", "$http", "characterRes", "$routeParams"
      ($scope, $http, characterRes, $routeParams) ->

        $scope.projectId = $routeParams.id

        characterRes.query({project_id: $scope.projectId}, (data)->
            $scope.characters = data;
        )

        # $scope.newCharacter = ->
        #   $scope.character = {}
        #   character = new projectRes($scope.project)
        #   newProject = project.$save ->

        $scope.saveCharacter = ->
          $scope.character.project_id = $routeParams.id
          characterRes.save($scope.character, (response)->
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
