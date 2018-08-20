app.controller('angularHttpController', ['$scope', '$http', '$q', function ($scope, $http, $q) {
    $scope.data = 0;
    $scope.GetNumbers = function (length) {
        if (length == undefined) length = 0;
        $http.get('api/default/getNumbers', { params: { "length": length } })
        .then(function (response) {
            $scope.data = response.data;
                console.log(response.data);
            });
    }
    $scope.gender = {
        type: 'male'
    }

    $scope.PostNumbers = function (person) {
        $http.post('api/default/postNumbers', person)
            .then(function (response) {
                alert("success")
                console.log(response.data);
            }, function (error) {
                alert("error");
            console.log(error);
        });
    }

    $scope.PutSomething = function (ar) {
        $http.put('api/default/PutSomething', ar)
            .then(function (response) {
                alert("success")
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    }
    $scope.DeleteList = function (ar) {
        $http.delete('api/default/DeleteSomething', ar)
            .then(function (response) {
                alert("success")
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    }
    $scope.DbSomething = function () {
        $http.get('api/default/getDbValues')
            .then(function (response) {
                alert("success")
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    }
}])