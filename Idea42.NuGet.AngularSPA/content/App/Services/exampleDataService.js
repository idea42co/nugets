ExampleDataService.$inject = ['dal'];
angular.module('angularSPA').service('exampleDataService', ExampleDataService);

function ExampleDataService(dal) {
    var _addTwoNumbers = function (data) {
        return dal.ajaxRequest('values/add', 'POST', data);

    };

    return {
        addTwoNumbers: _addTwoNumbers
    };

    // To make a call to the service, use dal.ajaxRequest('controller/method', '[POST|GET|PUT|ETC]', data);
    // The data that's returned is a promise, and you can subscribe to it like so

    // When you use the data service, simply include it by the name above, and call the provided method. Like in this example:
    //  exampleDataService.addTwoNumbers({ num1: 1, num2: 2 }).success(function(results){
    //       ... code to handle results here ...
    //  });

    // The 'dal' object already has the service URL in it, so you don't have to worry about it.

}