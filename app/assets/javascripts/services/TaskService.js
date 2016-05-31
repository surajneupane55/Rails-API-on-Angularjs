/**
 * Created by suraj on 12.5.2016.
 */
angular.module('todoApp').factory('Task', ['$resource', '$http', function($resource, $http){
    var Task;
  return Task = (function() {
      
      function Task(errorHandler) {
          var defaults;
          this.service = $resource('/api/tasks/:id', { id: '@id' 
          }, { update: {
              method: 'PATCH'
          }
          });
          this.errorHandler = errorHandler;
          defaults = $http.defaults.headers;
          defaults.patch = defaults.patch || {};
          defaults.patch['Content-Type'] = 'application/json';
      }
      
     Task.prototype.create = function(attrs, successHandler){
         return new this.service({
             task: attrs
         }).$save((function(task) {
             return successHandler(task);
         }), this.errorHandler);
     };
      
      Task.prototype["delete"] = function(task) {
          return new this.service().$delete({
              id: task.id
          }, (function() {
              return null;
          }), this.errorHandler);
      };
      
      Task.prototype.update = function( task, attrs) {
          return new this.service({
              task: attrs
          }).$update({
              id: task.id
          }, (function() {
              return null;
          }), this.errorHandler);
      };

      Task.prototype.all = function() {
          return this.service.query((function(){
              return null;
          }), this.errorHandler);
      };

      Task.prototype.find = function(id, successHandler) {
          return this.service.get({
              id: id
          }, (function(task) {
              if(typeof successHandler==="function"){
                  successHandler(task);
              }
              return task;
          }), this.errorHandler);
      };
      return Task;
      
  })();   
}]);