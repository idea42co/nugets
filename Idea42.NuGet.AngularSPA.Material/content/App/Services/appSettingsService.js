(function () {
    'use strict';

    angular.module('angularSPA').service('appSettings', AppSettingsModule);

    AppSettingsModule.$inject = ['dal', '$q'];

    function AppSettingsModule(dal, $q) {
        var hasCalledForSettings = false;
        var settings = [];

        var getSetting = function (key) {
            return $q(function (resolve, reject) {
                if (hasCalledForSettings) {
                    resolve(settings[key]);
                }
                else {
                    // Now we get the settings from the server
                    dal.ajaxRequest('appSettings', 'GET').then(function (success) {
                        hasCalledForSettings = true;
                        settings = success;
                        resolve(settings[key]);
                    }, function (error) {
                        reject(error);
                    });
                }
            });
        }

        return {
            getSetting: getSetting
        }
    }
})()

