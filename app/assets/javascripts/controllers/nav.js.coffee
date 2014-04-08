Ctrl = ($scope) ->
angular.module("artSlotApp").directive "nav", ->
  restrict: "E"
  template: "<button class=\"btn\">{{back}}</button><button class=\"btn\">{{forward}}</button>"
  scope:
    back: "@back"
    forward: "@forward"
    icons: "@icons"

  link: (scope, element, attrs) ->
    $(element[0]).on "click", ->
      history.back()
      scope.$apply()
      return

    $(element[1]).on "click", ->
      history.forward()
      scope.$apply()
      return

    return
