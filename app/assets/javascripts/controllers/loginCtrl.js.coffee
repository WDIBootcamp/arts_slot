angular.module("artSlotAppCtrls")
  .controller("loginCtrl", [
    "$scope", "$http"
      ($scope, $http) ->

          $scope.login_user =
            email: null
            password: null

          $scope.login_error =
            message: null
            errors: {}

          $scope.login = ->
            $scope.submit
              method: "POST"
              url: "../users/sign_in.json"
              data:
                user:
                  email: $scope.login_user.email
                  password: $scope.login_user.password
              success_message: "You have been logged in."
              error_entity: $scope.login_error
            return

          $scope.logout = ->
            $scope.submit
              method: "DELETE"
              url: "../users/sign_out.json"
              success_message: "You have been logged out."
              error_entity: $scope.login_error
            return

          $scope.submit = (parameters) ->
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
              return
            ).error(data, status) ->
              if status is 422
                parameters.error_entity.errors = data.errors
              else
                if data.errors
                  parameters.error_entity.message = data.error
                else
                  parameters.error_entity.message = "Unexplained error, potentially a server error, please report via support channels as this indicates a code defect.  Server response was: " + JSON.stringify(data)
              return
            return

          $scope.reset_messages = ->
            $scope.login_error.message = null
            $scope.login_error.errors = {}
            return

          $scope.reset_users = ->
            $scope.login_user.email = null
            $scope.login_user.password = null
            return

          return



  ])
