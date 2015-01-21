angular.module("eveCert").controller('ApiCharactersCtrl', ['$scope', 'CharacterService', '$rootScope', function($scope, CharacterService, $rootScope) {

  $scope.all = function() {
    CharacterService.all().then(function(characters){
      $scope.characters = characters
    }, function(){
      console.log(res, "failed");
    });
  };

  $scope.make_active = function(character_id) {
    CharacterService.make_active(character_id).then(function(success){
      $rootScope.$broadcast('refresh_active_character', "activated");
      $rootScope.showToast(success.name + ' activated!');
    }, function(){
      console.log(res, "failed");
    });
  };

  $scope.all();

}]);