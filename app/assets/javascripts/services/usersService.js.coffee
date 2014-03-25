angular.module("usersService", ["ngResource"])

    .factory "userRes", [
        "$resource"
        ($resource)->
            return $resource("/users/:id.json", id: "@id",
                  update:
                    method: "PATCH"
            )
    ]
