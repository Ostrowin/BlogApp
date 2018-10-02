app.factory('calisthenicsService', ['$http', '$q', function ($http, $q) {
    var service = {
        getExercises: getExercises,
        updateStep: updateStep
    };

    return service;

    function getExercises(exercise) {

        var data = $http.get('api/calisthenics/get' + exercise);
        return $q.when(data);

    }

    function updateStep(exeName, tmpExe) {
        var data = $http.put('api/calisthenics/update' + exeName, tmpExe)
            .then(function (response) {
            alert("success");
            console.log(response.data);
        }, function (error) {
            alert("error");
            console.log(error);
        });
        return $q.when(data);

    }

}]);