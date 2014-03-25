angular.module("charactersService", ["ngResource"])

    .factory "characterRes", [
        "$resource"
        ($resource)->
            return $resource("projects/:project_id/characters/:id.json", id: "@id", project_id: "@project_id",
                  update:
                    method: "PATCH"
            )
    ]
