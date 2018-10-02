app.config(['$translateProvider', function ($translateProvider) {

    $translateProvider.useStaticFilesLoader({
        prefix: 'api/Home/GetLanguage/lang',
        suffix: '.json'
    });
    $translateProvider.preferredLanguage('pl');

}]);