angular.module("eveCert").controller('ActiveCharacterCtrl', ['$scope', '$rootScope', 'CharacterService', '$mdBottomSheet', '$mdDialog', function($scope, $rootScope, CharacterService, $mdBottomSheet, $mdDialog) {

  $scope.active_character = "";

  $scope.showActive = false;

  var _self = this;

  $scope.$on('refresh_active_character', function (event, arg) {
    $scope.get_active();
  });

  $scope.get_active = function(){
    $rootScope.loading = true;
    CharacterService.active_character().then(function(res){
      $scope.active_character = res;
      $scope.showActive = !!$scope.active_character;
      $scope.items = $scope.active_character.skill_queue.items;
    }, function(){
      console.log(res, "failed");
    });
  };

  $scope.showAdvanced = function(ev) {
    $mdDialog.show({
      locals: {items: $scope.items},
      controller: ['$scope', 'items', function($scope, items) {
        $scope.items = items;
        $scope.hide = function() {
          $mdDialog.hide();
        };
      }],
      templateUrl: 'skillQueue.html',
      targetEvent: ev
    })
      .then(function(answer) {
        $scope.alert = 'You said the information was "' + answer + '".';
      }, function() {
        $scope.alert = 'You cancelled the dialog.';
      });
  };

  $scope.get_active();

}]);