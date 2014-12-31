angular.module("eveCert")
  .controller('UserSessionCtrl', ['$scope', '$mdToast', '$animate', function($scope, $mdToast, $animate) {

    $scope.message = 'This is Show orders screen';
    console.log($scope.message);

    $scope.showSimpleToast = function() {

    };

  }]);