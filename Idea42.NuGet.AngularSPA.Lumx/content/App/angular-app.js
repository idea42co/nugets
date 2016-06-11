function AngularAppConfiguration($routeProvider, $locationProvider, localStorageServiceProvider) {
    $routeProvider
        .when('/', {
            templateUrl: '/App/Views/home.html',
            controller: 'homeController',
            controllerAs: 'vm'
        })
        .otherwise({
            redirectTo: '/'
        });

    //Remove the need for the '#' in the URL.
    $locationProvider.html5Mode(true);
}

// Inject Dependencies
AngularAppConfiguration.$inject = ['$routeProvider', '$locationProvider', 'localStorageServiceProvider'];

angular.module('angularSPA', ['ngRoute', 'LocalStorageModule', 'lumx']);
angular.module('angularSPA').config(AngularAppConfiguration);