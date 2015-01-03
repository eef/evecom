angular.module("eveCert")
  .controller('UserSessionCtrl', ['$scope', '$rootScope', '$mdSidenav', '$location', function($scope, $rootScope, $mdSidenav, $location) {

    $scope.$on('auth:login-success', function(event, user) {
      $location.path("/");
      $rootScope.showToast("Login successful!");
    });

    $scope.$on('auth:logout-success', function() {
      $location.path("/sign_in");
      $rootScope.showToast("You have been logged out!");
    });

    $scope.$on('auth:registration-email-success', function() {
      $rootScope.showToast("Thank you for registering! Please confirm your email address");
    });

  }]);