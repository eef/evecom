app = angular.module('eveCert', [
  'templates',
  'ngCookies',
  'ngRoute',
  'ngResource',
  'ngAnimate',
  'ngAria',
  'ngMaterial',
  'ng-token-auth',
  'restangular',
  'timer'
]);

app.constant('VERSION', 1.0);

app.config(['$routeProvider', '$httpProvider', '$mdThemingProvider', function($routeProvider, $httpProvider, $mdThemingProvider){
  $routeProvider.when("/",{
    controller: "MainCtrl",
    templateUrl: "home/index.html"
  }).when("/sign_in",{
    controller: "UserSessionCtrl",
    templateUrl: "user_sessions/sign_in.html"
  }).when("/register",{
    controller: "UserSessionCtrl",
    templateUrl: "user_registrations/register.html"
  }).when("/add_character", {
    controller: "EveApiCtrl",
    templateUrl: "eve/add_character.html"
  }).when("/characters", {
    controller: "ApiCharactersCtrl",
    templateUrl: "characters/index.html"
  }).when("/character/:id", {
    controller: "CharacterCtrl",
    templateUrl: "characters/show.html"
  });;

}]);

app.run(['VERSION', '$rootScope', '$location', '$mdToast', '$mdSidenav', 'Restangular', function(VERSION, $rootScope, $location, $mdToast, $mdSidenav, Restangular){

  Restangular.addRequestInterceptor(function(element) {
    $rootScope.loading = true;

    return element;
  });
  Restangular.addResponseInterceptor(function(data) {
    $rootScope.loading = false;

    return data;
  });

  $rootScope.toastPosition = {
    bottom: true,
    top: false,
    left: false,
    right: true
  };

  $rootScope.romanize = function(number) {
    map = {
      "1":"I",
      "2":"II",
      "3":"III",
      "4":"IV",
      "5":"V"
    };
    return(map[number.toString()]);
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

  $rootScope.$on('auth:login-success', function(event, user) {
    $location.path("/");
    $rootScope.showToast("Login successful!");
    $rootScope.$broadcast('refresh_active_character', 'Login');
  });

  $rootScope.$on('auth:logout-success', function() {
    $location.path("/sign_in");
    $rootScope.showToast("You have been logged out!");
  });

  $rootScope.$on('auth:registration-email-success', function() {
    $location.path("/");
    $rootScope.showToast("Thank you for registering! Please confirm your email address");
  });

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