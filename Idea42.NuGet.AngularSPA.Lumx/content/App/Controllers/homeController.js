function HomeController(LxDialogService) {

    var ctrl = this;

    ctrl.description = 'And welcome to your new Angular SPA app. Follow the patterns here to create your web app!'
    ctrl.openModal = _openModal;

    ////////////

    function _openModal() {
        LxDialogService.open('testDialog');
    }
}

// Inject dependencies
HomeController.$inject = ['LxDialogService'];

angular.module('angularSPA').controller('homeController', HomeController);