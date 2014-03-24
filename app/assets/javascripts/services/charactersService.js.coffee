angular.module("charactersService", ["ngResource"])

    .factory "characterRes", [
        "$resource"
        ($resource)->
            return $resource("/characters/:id.json", id: "@id",
                  update:
                    method: "PATCH"
            )
    ]
