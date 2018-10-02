app.controller('dbRepoController', ['$scope', '$http', function ($scope, $http) {

    $scope.GetPersons = function () {
        $http.get('api/test/getPersons')
            .then(function (response) {
                $scope.data = response.data;
                console.log(response.data);
            });
    };
}]);