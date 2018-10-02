var app = angular.module('app', ['ngRoute', 'ui.bootstrap', 'ngAnimate','ngSanitize','pascalprecht.translate'])
    .run(['$rootScope', 'langService', '$uibModal','$translate', function ($rootScope, langService, $uibModal, $translate) {
        $rootScope.languages = {
            availableOptions: [
                { id: '1', name: 'pl', src: "App/Images/pl.png" },
                { id: '2', name: 'en', src: '"App/Images/en.png"' },
                { id: '3', name: 'es', src: '"App/Images/es.png"' }
            ],
            selectedOption: { id: '1', name: 'pl', src: "App/Images/pl.png" } //This sets the default value of the select in the ui
        };
        $rootScope.themes = {
            availableOptions: [
                { id: '1', name: 'light' },
                { id: '2', name: 'dark' }
            ],
            selectedOption: { id: '2', name: 'dark' }
        };
        $rootScope.Content = null;
        var init = function () {
            langService.getLang($rootScope.languages.selectedOption.name)
                .then(function (response) {
                    $rootScope.Content = response.data;
                });
        };
        $rootScope.$watch('languages.selectedOption', function (newValue, oldValue) {
            $translate.use($rootScope.languages.selectedOption.name);
        });
        init();

        $rootScope.openModal = function () {
            var modalInstance = " ";
            $rootScope.openModal = function () {
                modalInstance = $uibModal.open({
                    animation: false,
                    templateUrl: 'App/sharedPartials/modalLogIn.html',
                    controller: "modalOpenController",
                    ariaLabelledBy: 'modal-title',
                    ariaDescribedBy: 'modal-body',
                    size: 'lg',
                    backdrop: false,
                    resolve: {
                        payload: function () {
                            return {
                                msg_body: 'msg Body',
                                title: 'msg Title',
                                body_title: 'msg body Title'
                            };
                        }
                    }
                });
                modalInstance.result.then(function (response) {
                    //Get triggers when modal is closed
                    var data = response;
                    console.log(data.login);
                }, function () {
                    //gets triggers when modal is dismissed. You can basically handle data here
                });
            };
        };
    }]);