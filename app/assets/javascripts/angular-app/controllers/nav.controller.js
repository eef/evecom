angular.module("eveCert").controller('NavCtrl', ['$scope', '$mdSidenav', '$location', '$rootScope', function($scope, $mdSidenav, $location, $rootScope) {

  $scope.toggleNav = function() {
    $mdSidenav('left').toggle();
  };

  $scope.$on('auth:login-success', function(event, user) {
    $scope.user = user;
    $location.path("/");
    $rootScope.showToast("Login successful!");
  });

  $scope.$on('auth:logout-success', function() {
    $location.path("/sign_in");
    $rootScope.showToast("You have been logged out!");
  });

}]);