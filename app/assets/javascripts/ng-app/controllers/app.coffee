angular
  .module('todo')
  .controller 'AppCtrl', ($scope, $element, $http) ->
    # Handles response to a request created from a call to `$http`
    handleResponse = (promise) ->
      $scope.busy = true

      promise.success((response) ->
        $scope.busy  = false
        $scope.todos = response
      ).error (response) ->
        console.error response

    $scope.delete = (id) ->
      handleResponse $http.delete("/todos/#{id}")

    $scope.create = ->
      promise = $http.post('/todos', text: $scope.text)
      promise.success -> $scope.text = ''

      handleResponse promise

    $scope.update = (todo) ->
      handleResponse $http.patch("/todos/#{todo.id}", todo: { done: todo.done } )

    handleResponse $http.get('/todos')
