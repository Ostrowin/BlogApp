app.controller('pushUpsController', ['$scope', 'calisthenicsService', function ($scope, calisthenicsService) {

    $scope.wall = {};
    $scope.incline = {};
    $scope.kneeling = {};
    $scope.half = {};
    $scope.full = {};
    $scope.close = {};
    $scope.uneven = {};
    $scope.oneArmHalf = {};
    $scope.lever = {};
    $scope.oneArm = {};
    $scope.Active = "";

    calisthenicsService.getExercises("PushUps").then(function (response) {
        for (var i = 0; i < response.data.length; i++) {

            if (response.data[i].exercise === "Wall") {
                $scope.wall = response.data[i];
                if ($scope.wall.stepOne == true && $scope.wall.stepTwo == true && $scope.wall.stepThree == true)
                    $scope.wall.isDone = 1;
                else
                    $scope.wall.isDone = 0;
            }

            else if (response.data[i].exercise === "Incline") {
                $scope.incline = response.data[i];
                if ($scope.incline.stepOne == true && $scope.incline.stepTwo == true && $scope.incline.stepThree == true)
                    $scope.incline.isDone = 1;
                else
                    $scope.incline.isDone = 0;
            }

            else if (response.data[i].exercise === "Kneeling") {
                $scope.kneeling = response.data[i];
                if ($scope.kneeling.stepOne == true && $scope.kneeling.stepTwo == true && $scope.kneeling.stepThree == true)
                    $scope.kneeling.isDone = 1;
                else
                    $scope.kneeling.isDone = 0;
            }

            else if (response.data[i].exercise === "Half") {
                $scope.half = response.data[i];
                if ($scope.half.stepOne == true && $scope.half.stepTwo == true && $scope.half.stepThree == true)
                    $scope.half.isDone = 1;
                else
                    $scope.half.isDone = 0;
            }

            else if (response.data[i].exercise === "Full") {
                $scope.full = response.data[i];
                if ($scope.full.stepOne == true && $scope.full.stepTwo == true && $scope.full.stepThree == true)
                    $scope.full.isDone = 1;
                else
                    $scope.full.isDone = 0;
            }

            else if (response.data[i].exercise === "Close") {
                $scope.close = response.data[i];
                if ($scope.close.stepOne == true && $scope.close.stepTwo == true && $scope.close.stepThree == true)
                    $scope.close.isDone = 1;
                else
                    $scope.close.isDone = 0;
            }

            else if (response.data[i].exercise === "Uneven") {
                $scope.uneven = response.data[i];
                if ($scope.uneven.stepOne == true && $scope.uneven.stepTwo == true && $scope.uneven.stepThree == true)
                    $scope.uneven.isDone = 1;
                else
                    $scope.uneven.isDone = 0;
            }

            else if (response.data[i].exercise === "OneArmHalf") {
                $scope.oneArmHaf = response.data[i];
                if ($scope.oneArmHaf.stepOne == true && $scope.oneArmHaf.stepTwo == true && $scope.oneArmHaf.stepThree == true)
                    $scope.oneArmHaf.isDone = 1;
                else
                    $scope.oneArmHaf.isDone = 0;
            }

            else if (response.data[i].exercise === "Lever") {
                $scope.lever = response.data[i];
                if ($scope.lever.stepOne == true && $scope.lever.stepTwo == true && $scope.lever.stepThree == true)
                    $scope.lever.isDone = 1;
                else
                    $scope.lever.isDone = 0;
            }

            else if (response.data[i].exercise === "OneArm") {
                $scope.oneArm = response.data[i];
                if ($scope.oneArm.stepOne == true && $scope.oneArm.stepTwo == true && $scope.oneArm.stepThree == true)
                    $scope.oneArm.isDone = 1;
                else
                    $scope.oneArm.isDone = 0;
            }

        }
    });

    function checkStatus(obj) {
        console.log(obj);
        if (obj.stepOne == true && obj.stepTwo == true && obj.stepThree == true) return 1;
        else return 0;
    }
    $scope.statusWall = checkStatus($scope.wall);

    $scope.StepComplete = function (exercise, stepComplete) {
        var tmpExe = { exercise: exercise.exercise, step: stepComplete };
        console.log(tmpExe);
        calisthenicsService.updateStep("PushUps", tmpExe);
    };
   
}]);