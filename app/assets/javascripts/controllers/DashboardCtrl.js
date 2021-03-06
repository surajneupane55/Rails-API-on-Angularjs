/**
 * Created by suraj on 10.5.2016.
 */
angular.module('todoApp').controller('DashboardCtrl', ['$scope', '$location', '$routeParams','Task', function($scope, $location, $routeParams, Task){
    var serverErrorHandler;
    
    $scope.init = function() {
        this.taskService = new Task(serverErrorHandler);
        return $scope.tasks = this.taskService.all();
    }
    
    $scope.createTask= function (name) {

        if(name) {
            this.taskService.create({
                name: name }, function(task) {
                return $location.url("/tasks" + task.id);
            });
        }
        else {
            return alert ("Input field can't be empty!")
        }
    };
    
    $scope.deleteTask = function(task, index) {
        var result;
        result = confirm("Are you sure you want to remove this list?");
        if (result) { 
            this.taskService["delete"](task);
            return $scope.tasks.splice(index, 1);
        }
    };
    
    return serverErrorHandler = function() { 
        return alert("There was a server error, please reload the page and try again.");
    };
}]);