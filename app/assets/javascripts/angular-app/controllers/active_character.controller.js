angular.module("eveCert").controller('ActiveCharacterCtrl', ['$scope', '$rootScope', 'CharacterService', '$mdBottomSheet', function($scope, $rootScope, CharacterService, $mdBottomSheet) {

  $scope.active_character = "";

  $scope.showActive = false;

  $scope.$on('refresh_active_character', function (event, arg) {
    $scope.get_active();
  });

  $scope.get_active = function(){
    $rootScope.loading = true;
    CharacterService.active_character().then(function(res){
      $scope.active_character = res;
      $scope.showActive = !!$scope.active_character;
      $rootScope.loading = false;
    }, function(){
      console.log(res, "failed");
      $rootScope.loading = false;
    });
  };

  $scope.get_active();

}]);