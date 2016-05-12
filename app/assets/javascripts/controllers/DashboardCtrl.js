/**
 * Created by suraj on 10.5.2016.
 */
angular.module('todoApp').controller ('DashboardCtrl', ['$scope', 'Task',
    function($scope, Task){
        var task = Task.get({ id: $scope.id}, function(){
            console.log(task);
        });
    }]);