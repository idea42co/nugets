app.controller('shellController', ['$scope', '$rootScope', '$route', 'appSettings', 'dal', function ($scope, $rootScope, $route, appSettings, dal) {

    angular.element(document).ready(function () {

        appSettings.getSetting('rootApiUrl').then(function (data) {
            $rootScope.rootApiUrl = data;
            $route.reload();
        });
    });
}]);