app = angular.module('eveCert', [
  'templates',
  'ngCookies',
  'ngRoute',
  'ngAnimate',
  'ngAria',
  'ngMaterial',
  'ng-token-auth'
]);

app.constant('VERSION', 1.0);

app.config(['$routeProvider', '$mdThemingProvider', function($routeProvider, $mdThemingProvider){
  $routeProvider.when("/",{
    controller: "MainCtrl",
    templateUrl: "home/index.html"
  }).when("/sign_in",{
    controller: "UserSessionCtrl",
    templateUrl: "user_sessions/sign_in.html"
  });
}]);

app.run(['VERSION', '$rootScope', '$location', function(VERSION, $rootScope, $location){
  console.log(VERSION);
}]);