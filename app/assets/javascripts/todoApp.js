/**
 * Created by suraj on 9.5.2016.
 */
todoApp = angular.module('todoApp',['ngRoute', 'ngResource', 'ui.bootstrap']);


//make it work with csrf-token in rails application
todoApp.config (['$httpProvider',
    function ($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }]);


todoApp.config (['$routeProvider', '$locationProvider',

//application URL deep linking with html5
    function ($routeProvider, $locationProvider) {

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
        $locationProvider.html5Mode(true);


}]);

//making turbolink in rails work with angularjs


$(document).on('ready page:load', function(arguments) {
    angular.bootstrap(document.body, ['todoApp'])
});