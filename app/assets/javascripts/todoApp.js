/**
 * Created by suraj on 9.5.2016.
 */
todoApp = angular.module('todoApp',['ngRoute', 'ngResource']);


//make it work with csrf-token in rails application
todoApp.config (['$httpProvider',
    function ($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }]);


todoApp.config (['$routeProvider', '$locationProvider',

//application URL deep linking with html5
    function ($routeProvider, $locationProvider) {
    $locationProvider.html5Mode = true;

//configuring route for application
    $routeProvider.
        when('/', {
        redirectTo: '/dashboard'
    }).
        when('/dashboard', {
        templateUrl: '/templates/dashboard.html',
        controller: 'DashboardCtrl'
    }).
        when('/tasks/:task_id', {
        templateUrl: '/templates/task.html',
        controller: 'ListCtrl'
    }).
        otherwise({redirectTo: '/dashboard'
    })


}]);

//making turbolink in rails work with angularjs
$(document).on('page:load', function() {
    return $('[ng-app]').each(function(){
        var module;
        module = $(this).attr('ng-app');
        return angular.bootstrap(this, [module]);
    });
});