app.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
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