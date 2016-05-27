/**
 * Created by suraj on 10.5.2016.
 */
angular.module('todoApp').controller("ListCtrl", function($scope, $timeout, $routeParams, Task, List){
    var serverErrorHandler;
    $scope.init = function() {
        this.listService = new List($routeParams.task_id, serverErrorHandler);
        this.taskService = new Task(serverErrorHandler);
        return $scope.task = this.taskService.find($routeParams.task_id)
    };

    $scope.addList = function() {
        var list;
        list = this.listService.create({
            description: $scope.listDescription
        });
    };
    $scope.deleteList = function(list) {
        this.listService["delete"](list);
        return $scope.tasks.splice($scope.task.lists.indexOf(list), 1);
    };

    $scope.taskNameEdited = function(taskName) {
        return this.taskService.update(this.task, {
            name: taskName
        });
    };


})