/**
 * Created by suraj on 10.5.2016.
 */
angular.module('todoApp').controller("ListCtrl", ['$scope', '$routeParams', 'Task', 'List', function($scope, $routeParams, Task, List){
    var serverErrorHandler;
    $scope.init = function() {
        $scope.hoverIn = function(){
            this.hoverEdit = true;
        };
        $scope.hoverOut = function(){
            this.hoverEdit = false;
        };
        $scope.checkEdit = function(){
            this.displayField = true;
        };
        this.taskService = new Task(serverErrorHandler);
        this.listService = new List($routeParams.task_id, serverErrorHandler);
        return $scope.task = this.taskService.find($routeParams.task_id)
    };

    $scope.addList = function() {
        var list;
        list = this.listService.create({
            description: $scope.listDescription
        });
       return $scope.listDescription = "";

    };
    $scope.deleteList = function(list) {
        this.listService["delete"](list);
        return $scope.task.lists.splice($scope.task.lists.indexOf(list), 1);
    };

    $scope.taskNameEdited = function(taskName) {
        return this.taskService.update(this.task, {
            name: taskName
        });
    };


}]);