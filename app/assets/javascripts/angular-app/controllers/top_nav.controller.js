angular.module("eveCert").controller('TopNavCtrl', ['$scope', '$mdSidenav', function($scope, $mdSidenav) {

  $scope.toggleNav = function() {
    $mdSidenav('left').toggle();
  };

}]);