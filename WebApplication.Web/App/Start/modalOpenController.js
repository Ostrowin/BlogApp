app.controller('modalOpenController', ['$rootScope', '$scope', '$uibModalInstance', 'payload', 
    function ($rootScope, $scope, $uibModalInstance, payload) {

        /*TODO: ask is that good? Is service (which is correct) better?*/

        $rootScope.LoginFields = {
            login: '',
            password: '',
            email: ''
        };
        $scope.form = {};
        

        $scope.displayForm = function () {
            console.log($scope.form.LoginForm.$valid);
        }
        var sameEmail = false;
        var samePassword = false;
        $scope.isLoginFormReallyValid = false;

        $scope.checkEmail = function () {
            if ($scope.LoginFields.email === $scope.confirmedEmailValue) {
                sameEmail = true;
            } else {
                sameEmail = false;
            }
        }
        $scope.checkPassword = function () {
            if ($scope.LoginFields.password === $scope.confirmedPasswordValue) {
                samePassword = true;
            } else {
                samePassword = false;
            }
        }
        $scope.checkFormValid = function () {
            if (sameEmail == true
                && samePassword == true
                && $scope.form.LoginForm.$valid == true) {
                $scope.isLoginFormReallyValid = true;
            } else {
                $scope.isLoginFormReallyValid = false;
            }
                    
        }

        $scope.ok = function () {
            $uibModalInstance.close($rootScope.LoginFields);
        };

        $scope.close = function () {
            $uibModalInstance.dismiss('cancel');
        };

}]);