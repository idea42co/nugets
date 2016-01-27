app.service('appSettings', ['dal', '$q', function (dal, $q) {
    'use strict';

    var hasCalledForSettings = false;
    var settings = [];

    var getSetting = function (key) {
        return $q(function (resolve, reject) {
            if (hasCalledForSettings) {
                resolve(settings[key]);
            }
            else {
                // Now we get the settings from the server
                dal.ajaxRequest('appSettings', 'GET').success(function (results) {
                    hasCalledForSettings = true;
                    settings = results;
                    resolve(settings[key]);
                }).error(function (error) {
                    reject(error);
                });
            }
        });
    }

    return {
        getSetting: getSetting
    }
}]);