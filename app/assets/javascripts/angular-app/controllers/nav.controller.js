angular.module("eveCert").controller('NavCtrl', ['$scope', '$mdSidenav', function($scope, $mdSidenav) {

  $scope.toggleNav = function() {
    $mdSidenav('left').toggle();
  }

}]);