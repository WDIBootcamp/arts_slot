angular.module("projectsService", ["ngResource"])

    .factory "projectRes", [
        "$resource"
        ($resource)->
            return $resource("/projects/:id.json", id: "@id",
                  update:
                    method: "PATCH"
            )
    ]
