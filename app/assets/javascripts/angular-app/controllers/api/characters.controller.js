angular.module("eveCert").controller('ApiCharactersCtrl', ['$scope', 'CharacterService', '$rootScope', function($scope, CharacterService, $rootScope) {

  $scope.all = function() {
    CharacterService.all().then(function(characters){
      $scope.characters = characters
    }, function(){
      console.log(res, "failed");
    });
  };

  $scope.all();

}]);