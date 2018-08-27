app.controller('angularDatabasesController', ['$scope', '$http', '$q', function ($scope, $http, $q) {
    $scope.data = 0;
    $scope.GetValues = function (com, from, where) {
        if (!com) com = "* ";
        if (!from) {
            console.log("from?");
            return;
        }

        var commandStr = "Select " + com + " from " + from;

        if (where) commandStr = commandStr + " where " + where;
        console.log(commandStr);
        $http.get('api/db/getData', { params: { "commandStr": commandStr } })
            .then(function (response) {
                $scope.data = response.data;
                console.log(response.data);
            });
    };
    $scope.PostValues = function (DbDTO) {
        console.log(DbDTO);
        $http.post('api/db/UpdateData', DbDTO)
            .then(function (response) {
                alert("success");
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    };

    $scope.PutValues = function (person) {
        $http.put('api/db/PutData', person)
            .then(function (response) {
                alert("success");
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    };
    $scope.DeleteValues = function (deleteFrom, dWhere) {
        $http.delete('api/db/DeleteData', { params: { "deleteFrom": deleteFrom, "dWhere": dWhere } })
            .then(function (response) {
                alert("success");
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    };

    $scope.CreateTable = function () {
        $http.post('api/db/CreateTable')
            .then(function (response) {
                alert("success");
                console.log(response.data);
            }, function (error) {
                alert("error");
                console.log(error);
            });
    };
}]);