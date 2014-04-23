angular.module("artSlotAppCtrls")
  .controller("loginCtrl", [
    "$scope", "$http", "$location", "projectRes"
      ($scope, $http, $location, projectRes) ->

        $scope.login_user =
          email: null
          password: null

        $scope.login_error =
          message: null
          errors: {}

        $scope.register_user =
          email: null
          password: null
          password_confimation: null

        $scope.register_error =
          email: null
          password: null
          password_confirmation: null
          errors: {}

        $scope.login = ->
          $scope.submit
            method: "POST"
            url: "/users/sign_in.json"
            data:
              user:
                email: $scope.login_user.email
                password: $scope.login_user.password
            success_message: "You have been logged in."
            error_entity: $scope.login_error
          $location.path("/")

        $scope.logout = ->
          $scope.submit
            method: "DELETE"
            url: "/users/sign_out.json"
            success_message: "You have been logged out."
            error_entity: $scope.login_error
          return

        $scope.password_reset = ->
          $scope.submit
            method: "POST"
            url: "/users/password.json"
            data:
              user:
                email: $scope.login_user.email
            success_message: "Reset instructions have been sent to your e-mail address."
            error_entity: $scope.login_error

        # $scope.unlock = ->
        #   $scope.submit
        #     method: "POST"
        #     url: "/users/unlock.json"
        #     data:
        #       user:
        #         email: $scope.login_user.email
        #     success_message: "An unlock e-mail has been sent to your e-mail address."
        #     error_entity: $scope.login_error

        $scope.confirm = ->
          $scope.submit
            method: "POST"
            url: "/users/confirmation.json"
            data:
              user:
                email: $scope.login_user.email
            success_message: "A new confirmation link has been sent to your e-mail address."
            error_entity: $scope.login_error

        $scope.register_producer = ->
          $scope.submit(
            method: "POST"
            url: "/users.json"
            data:
              user:
                email: $scope.register_user.email
                password: $scope.register_user.password
                password_confirmation: $scope.register_user.password_confirmation
            success_message: "You have been registered and logged in.  A confirmation e-mail has been sent to your e-mail address."
            error_entity: $scope.register_error
            $scope.redirectToNewProject
            )

        # this method is here so that the producer can be taken
        # to a new project page as soon as he registers
        $scope.redirectToNewProject = ->
          $scope.project = {}
          project = new projectRes($scope.project)
          newProject = project.$save ->
              $location.path("/projects/"+project.id)


        $scope.register_actor = ->
          $scope.submit(
            method: "POST"
            url: "/users.json"
            data:
              user:
                email: $scope.register_user.email
                password: $scope.register_user.password
                password_confirmation: $scope.register_user.password_confirmation
            success_message: "You have been registered and logged in.  A confirmation e-mail has been sent to your e-mail address."
            error_entity: $scope.register_error,
            $scope.redirectToUser
            )

        # this method redirects the user (who chose actor)
        #to his edit info page
        $scope.redirectToUser = (data) ->
          console.log angular.toJson data
          $location.path("/users/"+data.id+"/edit")

        $scope.loginPage = ->
          $location.path("/login")

        $scope.registerPage = ->
          $location.path("/")

        $scope.change_password = ->
          $scope.submit
            method: "PUT"
            url: "/users/password.json"
            data:
              user:
                email: $scope.register_user.email
                password: $scope.register_user.password
                password_confirmation: $scope.register_user.password_confirmation
            success_message:  "Your password has been updated."
            error_entity: $scope.register_error
          return

        $scope.submit = (parameters, callback) ->
          $scope.reset_messages()
          $http(
            method: parameters.method
            url: parameters.url
            data: parameters.data
          ).success((data, status) ->
            if status is 201 or status is 204
              parameters.error_entity.message = parameters.success_message
              $scope.reset_users()
            else
              if data.error
                parameters.error_entity.message = data.error
              else
                parameters.error_entity.message = "Success, but with an unexpected success code, potentially a server error, please report via support channels as this indicates a code defect.  Server response was: " + JSON.stringify(data)
            if callback? then callback data
          ).error((data, status) ->
            if status is 422
              parameters.error_entity.errors = data.errors
            else
              if data.errors
                parameters.error_entity.message = data.error
              else
                parameters.error_entity.message = "Unexplained error, potentially a server error, please report via support channels as this indicates a code defect.  Server response was: " + JSON.stringify(data)
            return
          )
          return

        $scope.reset_messages = ->
          $scope.login_error.message = null
          $scope.login_error.errors = {}
          $scope.register_error.message = null
          $scope.register_error.errors = {}
          return

        $scope.reset_users = ->
          $scope.login_user.email = null
          $scope.login_user.password = null
          $scope.register_user.email = null
          $scope.register_user.password = null
          $scope.register_user.password_confirmation = null
          return


  ])
