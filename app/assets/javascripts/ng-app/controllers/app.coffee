angular
  .module('todo')
  .controller 'AppCtrl', ($scope, $element, $http) ->
    $scope.busy = true

    $http.get('/todos')
      .success((response) ->
        $scope.busy  = false
        $scope.todos = response
      ).error (response) ->
        console.error response

    $scope.delete = (id) ->
      $scope.busy = true

      $http.delete("/todos/#{id}")
        .success((response) ->
          $scope.busy  = false
          $scope.todos = response
        ).error (response) ->
          console.error response

    $scope.create = ->
      $scope.busy = true

      $http.post('/todos', text: $scope.text)
        .success((response) ->
          $scope.busy  = false
          $scope.text  = ''
          $scope.todos = response
        ).error (response) ->
          console.error response

    $scope.update = (todo) ->
      $scope.busy = true

      $http.patch("/todos/#{todo.id}", todo: { done: todo.done } )
        .success((response) ->
          $scope.busy  = false
          $scope.todos = response
        ).error (response) ->
          console.error response
