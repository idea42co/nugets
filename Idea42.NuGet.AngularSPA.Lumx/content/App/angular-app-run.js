function AngularAppRunConfiguration($rootScope, $location, localStorageService) {
    $rootScope.$on("$routeChangeStart", function (event, next, current) {

        // Us this to determine if your app is authenticated. Typically, you would store a session token, but to keep it simple, we are storing a boolean.
        // Customize this to fit your needs!
        if ((localStorageService.get("isLoggedIn") == null || localStorageService.get("isLoggedIn") == false) && next.$$route) {
            //$location.path("/login");
        }
    });
}

AngularAppRunConfiguration.$inject = ['$rootScope', '$location', 'localStorageService'];

angular.module('angularSPA').run(AngularAppRunConfiguration);