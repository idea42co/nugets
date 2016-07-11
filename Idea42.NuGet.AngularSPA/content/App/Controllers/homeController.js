HomeController.$inject = ['$scope'];
angular.module('angularSPA').controller('homeController', HomeController);

function HomeController($scope) {
    $scope.description = 'And welcome to your new Angular SPA app. Follow the patterns here to create your web app!'
}