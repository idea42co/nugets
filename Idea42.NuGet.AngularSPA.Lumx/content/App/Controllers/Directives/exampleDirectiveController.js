function ExampleDirectiveController($scope) {

    var exampleDir = this;

    exampleDir.directiveMessage = 'Hello from the directive!!!';
    exampleDir.modelValue = $scope.modelValue;
}

// Inject dependencies
ExampleDirectiveController.$inject = ['$scope'];

angular.module('angularSPA').controller('exampleDirectiveController', ExampleDirectiveController);