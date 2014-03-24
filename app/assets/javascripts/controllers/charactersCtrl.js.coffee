angular.module("artSlotAppCtrls")
  .controller("charactersCtrl", [
    "$scope", "$http", "characterRes"
      ($scope, $http, characterRes) ->
        #
        # $scope.allCharacters = []
        #
        # characterRes.query((data) ->
        #     console.log(data);
        #     $scope.allCharacters = data;
        #     )
        #
        # $scope.saveCharacter = ->
        #   newCharacter = characterRes.save($scope.character)
        #   $scope.allCharacters.push(newCharacter)

        $scope.test = ->
          alert("hello!!!")

  ])
