ShellController.$inject = ['$scope', '$rootScope', '$route', 'appSettings', 'dal']
angular.module('angularSPA').controller('shellController', ShellController);

function ShellController($scope, $rootScope, $route, appSettings, dal) {
    angular.element(document).ready(function () {
        appSettings.getSetting('rootApiUrl').then(function (data) {
            $rootScope.rootApiUrl = data;
            $route.reload();
        });
    });
}

