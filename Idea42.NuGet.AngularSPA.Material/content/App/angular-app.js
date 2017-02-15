(function () {
    'use strict';

    angular.module('angularSPA', ['ngRoute', 'ngMaterial']);
    angular.module('angularSPA').config(AngularAppConfiguration);

    AngularAppConfiguration.$inject = ['$routeProvider', '$locationProvider'];


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
})();

