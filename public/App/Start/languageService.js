app.factory('langService', ['$http', '$q', function ($http, $q) {
    var service = {
        getLang: getLang
    };

    return service;

    function getLang(lang) {

        var data = $http.get('api/Home/GetLanguage/lang' + lang + '.json');
        return $q.when(data);

    }
}]);