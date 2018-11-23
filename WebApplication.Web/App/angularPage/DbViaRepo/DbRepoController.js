app.controller('dbRepoController', ['$scope', '$http', function ($scope, $http) {
    $scope.data = 0;
    $scope.data2 = 0;
    $scope.data3 = 0;
    $scope.data4 = 0;
    $scope.GetPersons = function () {
        if ($scope.data === 0) {
            $http.get('api/test/getPersons')
                .then(function (response) {
                    $scope.data = response.data;
                    console.log(response.data);
                });
        }
        else {
            $scope.data = 0;
        }
    };

    $scope.GetCustomers = function () {
        if ($scope.data2 === 0) {
            $http.get('api/test/getCustomers')
                .then(function (response) {
                    $scope.data2 = response.data;
                    console.log(response.data);
                }, function (error) {
                    alert("error");
                    console.log(error);
                });
        }
        else {
            $scope.data2 = 0;
        }
    };

    $scope.GetProducts = function () {
        if ($scope.data3 === 0) {
            $http.get('api/test/getProducts')
                .then(function (response) {
                    $scope.data3 = response.data;
                    console.log(response.data);
                },function (error) {
                    alert("error");
                    console.log(error);
                });
        }
        else {
            $scope.data3 = 0;
        }
    };

    $scope.GetPerson = function (personId) {
        if ($scope.data4 === 0) {
            console.log("if");
            $http.get('api/test/getPerson', { params: { personId: personId } })
                .then(function (response) {
                    console.log("then");
                    $scope.data4 = response.data;
                }, function (error) {
                    console.log(error);
                });
        }
        else {
            $scope.data4 = 0;
        }
    };

    $scope.DeletePerson = function (personIdDelete) {
        $http.delete('api/test/deletePerson', { params: { personId: personIdDelete } })
            .then(function (response) {
                console.log(response.data);
            }, function (error) {
                console.log(error);
            });
    };
}]);