/*
Use this as an example for creating models in Angular.

Models are helpful for when you need to calculation, or perform opperation, on data that's specific to a certain context. 

In this case, we are giving this object 2 numbers and providing a function to add the numbers. 
*/
function AdditionModelFactory() {

    function AdditionModel(field1, field2) {
        var self = this;

        self.Field1 = Number(typeName);
        self.Field2 = Number(field);
        self.AddNumbers = _addNumbers;

        ////////////

        function _addNumbers() {
            return self.Field1 + self.Field2;
        }
    }

    return AdditionModel;

}

AdditionModelFactory.$inject = [];

angular.module('angularSPA').factory('AdditionModel', AdditionModelFactory);