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

app.config(['$routeProvider', '$mdThemingProvider', '$authProvider', function($routeProvider, $mdThemingProvider, $authProvider){
  $routeProvider.when("/",{
    controller: "MainCtrl",
    templateUrl: "home/index.html"
  }).when("/sign_in",{
    controller: "UserSessionCtrl",
    templateUrl: "user_sessions/sign_in.html"
  }).when("/register",{
    controller: "UserSessionCtrl",
    templateUrl: "user_registrations/register.html"
  });
  $authProvider.configure({
    authProviderPaths : {
      eve: "/auth/eve"
    }
  });
}]);

app.run(['VERSION', '$rootScope', '$location', '$mdToast', '$mdSidenav', function(VERSION, $rootScope, $location, $mdToast, $mdSidenav){

  $rootScope.toastPosition = {
    bottom: true,
    top: false,
    left: false,
    right: true
  };

  $rootScope.getToastPosition = function() {
    return Object.keys($rootScope.toastPosition)
      .filter(function(pos) { return $rootScope.toastPosition[pos]; })
      .join(' ');
  };

  $rootScope.showToast = function(alert) {
    $mdToast.show(
      $mdToast.simple()
        .content(alert)
        .position($rootScope.getToastPosition())
        .hideDelay(2000)
    );
  };

  //$rootScope.$on('auth:login-success', function() {
  //  $location.path('/');
  //  //$rootScope.showToast("Login successful!");
  //});
  //
  //$rootScope.$on('auth:logout-success', function() {
  //  $location.path('/sign_in');
  //  $rootScope.showToast("You have been logged out!");
  //});

}]);