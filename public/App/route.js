app.config(['$routeProvider', '$locationProvider','$translateProvider', function ($routeProvider, $locationProvider, $translateProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'App/Start/start.html',
            controller: 'startController'
        })
        .when('/home', {
            templateUrl: 'App/Home/home.html',
            controller: 'homeController'
        })
        .when('/angularPage', {
            templateUrl: 'App/angularPage/angular.html',
            controller: 'angularController'
        })
        .when('/angularPage/angularHttp', {
            templateUrl: 'App/angularPage/Http/angularHttp.html',
            controller: 'angularHttpController'
        })
        .when('/angularPage/angularDatabases', {
            templateUrl: 'App/angularPage/Databases/angularDatabases.html',
            controller: 'angularDatabasesController'
        })
        .when('/angularPage/dbViaRepo', {
            templateUrl: 'App/angularPage/DbViaRepo/DbRepo.html',
            controller: 'dbRepoController'
        })
        .when('/angularPage/dbViaRepo/updatePerson', {
            templateUrl: 'App/angularPage/DbViaRepo/UpdatePerson/updatePerson.html',
            controller: 'UpdatePersonController'
        })
        .when('/angularPage/UIBootstrap', {
            templateUrl: 'App/angularPage/UIBootstrap/uibootstrap.html',
            controller: 'UIBootstrapController'
        })
        .when('/calisthenics', {
            templateUrl: 'App/Calisthenics/calisthenics.html',
            controller: 'calisthenicsController'
        })
        .when('/calisthenics/push-ups', {
            templateUrl: 'App/Calisthenics/Push-Ups/calisthenicsPushUps.html',
            controller: 'pushUpsController'
        })
        .otherwise({
            redirectTo: '/'
        });

    $locationProvider.html5Mode(true);
}]);