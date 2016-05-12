/**
 * Created by suraj on 12.5.2016.
 */
angular.module('todoApp').factory('Task', function($resource){
    return $resource('/api/tasks/:id');
    
    
});