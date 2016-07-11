DataAccessLayerService.$inject = ['$http', '$rootScope'];
angular.module('angularSPA').service('dal', DataAccessLayerService);

function DataAccessLayerService($http, $rootScope) {
    $rootScope.rootApiUrl = "/api/";

    function ajaxRequest(url, requestType, data) {
        return $http({
            method: requestType,
            url: $rootScope.rootApiUrl + url,
            headers: {
                'content-type': 'application/json'
            },
            data: data
        });
    }

    function multiPartDataRequest(url, data) {

        var fd = new FormData();
        fd.append('file', data);
        return $http.post($rootScope.rootApiUrl + url, fd, {
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined,
                'X-Requested-With': 'XMLHttpRequest'
            }
        });
    }

    function formFileUploadDataRequest(url, data) {

        var fd = new FormData(data);

        var i = 0;
        for (i; i < data.length; i++) {
            fd.append('uploader', data[i]);
        }
        return $http.post($rootScope.rootApiUrl + url, fd, {
            transformRequest: angular.identity,
            headers: {
                'Content-Type': undefined,
                'X-Requested-With': 'XMLHttpRequest'
            }
        });
    }

    return {
        ajaxRequest: ajaxRequest,
        multiPartDataRequest: multiPartDataRequest,
        formFileUploadDataRequest: formFileUploadDataRequest
    };
}