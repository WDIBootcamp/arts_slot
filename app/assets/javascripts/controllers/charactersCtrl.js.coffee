angular.module("artSlotAppCtrls")
  .controller("charactersCtrl", [
    "$scope", "$http", "characterRes", "$routeParams"
      ($scope, $http, characterRes, $routeParams) ->

        $scope.projectID = $routeParams.id

        $scope.allCharacters = []

        characterRes.query((data) ->
            console.log(data);
            $scope.allCharacters = data;
            )

        $scope.saveCharacter = ->
          newCharacter = characterRes.save($scope.projectID, $scope.character)
          $scope.allCharacters.push(newCharacter)

        $scope.gender = [
          {name: "male"}
          {name: "female"}
        ]


  ])
