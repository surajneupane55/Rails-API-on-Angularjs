/**
 * Created by suraj on 23.5.2016.
 */
angular.module('todoApp').factory('List', ['$resource', '$http', function($resource, $http){
    var List;
    return List = (function() {
        function List(taskId, errorHandler) {
            var defaults;
            this.service = $resource('/api/tasks/:task_id/lists/:id', {
                task_id: taskId,
                id: '@id'
            }, {
                update: {
                    method: 'PATCH'
                }
            });
            this.errorHandler = errorHandler;
            defaults = $http.defaults.headers;
            defaults.patch = defaults.patch || {};
            defaults.patch['Content-type'] = 'application/json';
        }

        List.prototype.create = function(attrs) {
            new this.service({
                list: attrs
            }).$save((function(list){
                return attrs.id = list.id;
                }), this.errorHandler);
            return attrs;
        };
        
        List.prototype["delete"] = function(list) {
            return new this.service().$delete({
                id: list.id 
            }, (function() {
               return null; 
            }), this.errorHandler);
        };
        
        List.prototype.update = function(list, attrs) {
            return new this.service({
                list: attrs
            }).$update({
                id: task.id
            }, (function(){
                return null;
            }), this.errorHandler);
        };
        
        List.prototype.all = function() {
          return this.service.query((function() {
              return null;
          }), this.errorHandler);
        };



        return List;
    })();
}]);