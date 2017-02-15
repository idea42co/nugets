(function () {
    'use strict';

    angular.module('angularSPA').controller('homeController', HomeController);

    HomeController.$inject = [];
    
    function HomeController($scope) {

        var vm = this;

        vm.description = 'And welcome to your new Angular SPA app. Follow the patterns here to create your web app!'
    }
})();

