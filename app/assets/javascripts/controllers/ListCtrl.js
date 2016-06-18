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
        this.listService = new List($routeParams.task_id, serverErrorHandler);
        this.taskService = new Task(serverErrorHandler);
        return $scope.task = this.taskService.find($routeParams.task_id)
    };
    //implement strike for completed task
    $scope.checked = function(list, index){
        $scope.status =  [];
        if(list.status==true){
            $scope.status[index] = true;
        }
    }

    $scope.completed = function(index) {
        if (list.status == true) {
            $scope.checked[index] = true;
        }
    };
    

    $scope.addList = function() {
        var list;
        list = this.listService.create({
            description: $scope.listDescription
        });
        $scope.task.lists.unshift(list);
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
// calendar implementation
      
    $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
    $scope.format = $scope.formats[2];
    $scope.altInputFormats = ['M!/d!/yyyy'];

    $scope.openDatePickers = [];
    $scope.open1 = function ($event, datePickerIndex) {
        $event.preventDefault();
        $event.stopPropagation();

        if ($scope.openDatePickers[datePickerIndex] === true) {
            $scope.openDatePickers.length = 0;
        } else {
            $scope.openDatePickers.length = 0;
            $scope.openDatePickers[datePickerIndex] = true;
        }
    };
     $scope.updateDue_date_list = function(list) {
         if (list.status == true) {
             $scope.status[index] = true;
         }
         this.listService.update(this.list,  {
             due_date: list.due_date
         });

     };

    $scope.updateStatus_list = function(list, index) {

               this.listService.update(this.list, {
            status: list.status
        });
    };


}]);