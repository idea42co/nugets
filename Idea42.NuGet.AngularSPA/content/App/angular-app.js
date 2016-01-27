var app = angular.module('angularSPA', ['ngRoute']);

// configure our routes
app.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider
        .when('/', {
            templateUrl: '/App/Views/home.html',
            controller: 'homeController'
        })
        .otherwise({
            redirectTo: '/'
        });

    //Remove the need for the '#' in the URL.
    $locationProvider.html5Mode(true); 
}]);

// Configures the base for any service calls. 
// See examples in /App/Services
app.service('dal', [
    '$http', '$rootScope', function ($http, $rootScope) {
        "use strict";

        $rootScope.rootApiUrl = "/api/";

        function ajaxRequest(url, requestType, data) {
            return $http({
                method: requestType,
                url: $rootScope.rootApiUrl + url,
                headers: {
                    'content-type': 'application/json'
                },
                data: data
            });
        }

        function multiPartDataRequest(url, data) {

            var fd = new FormData();
            fd.append('file', data);
            return $http.post($rootScope.rootApiUrl + url, fd, {
                transformRequest: angular.identity,
                headers: {
                    'Content-Type': undefined,
                    'X-Requested-With': 'XMLHttpRequest'
                }
            });
        }

        function formFileUploadDataRequest(url, data) {

            var fd = new FormData(data);

            var i = 0;
            for (i; i < data.length; i++) {
                fd.append('uploader', data[i]);
            }
            return $http.post($rootScope.rootApiUrl + url, fd, {
                transformRequest: angular.identity,
                headers: {
                    'Content-Type': undefined,
                    'X-Requested-With': 'XMLHttpRequest'
                }
            });
        }

        return {
            authAjaxRequest: authAjaxRequest,
            ajaxRequest: ajaxRequest,
            multiPartDataRequest: multiPartDataRequest,
            formFileUploadDataRequest: formFileUploadDataRequest
        };
    }
]);

