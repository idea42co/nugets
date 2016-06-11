function ExampleDirective() {

    var directive = {
        restrict: 'EA',
        scope: {
            modelValue: '='
        },
        templateUrl: 'App/Views/Directives/example.html',
        controller: 'exampleDirectiveController',
        controllerAs: 'exampleDir'
    }

    return directive;
}

angular.module('angularSPA').directive('example', ExampleDirective);
