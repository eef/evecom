angular.module("eveCert").controller('NavCtrl', ['$scope', '$mdSidenav', '$location', '$rootScope', function($scope, $mdSidenav, $location, $rootScope) {

  $scope.toggleNav = function() {
    $mdSidenav('left').toggle();
  };

}]);