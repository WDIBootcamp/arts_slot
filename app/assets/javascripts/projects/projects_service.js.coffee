angular.module("ProjectsService", ["ngResource"])

    .factory "ProjectRes", [
        "$resource"
        ($resource)->
            return $resource("/projects/:id.json", id: "@id",
                  update:
                    method: "PATCH"
            )
    ]
