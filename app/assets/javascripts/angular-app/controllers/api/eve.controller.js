angular.module('eveCert')
  .controller("EveApiCtrl", ['$scope', 'ApiCharacterService', '$rootScope', function($scope, ApiCharacterService, $rootScope) {
    $scope.showCharacters = false;
    $scope.getCharacters = function(accountForm){
      ApiCharacterService.characters(accountForm).then(function(res){
        $scope.characters = res.eve;
        if($scope.characters.length > 0) {
          $rootScope.showToast($scope.characters.length + " characters found!");
          $scope.showCharacters = true;
        } else {
          $rootScope.showToast("No characters!");
        }
      }, function(){
        $rootScope.showToast("Unable to retrieve characters!");
      });
    }

    $scope.addCharacters = function() {
      if(_.size(angular.copy($scope.add_characters)) > 0) {
        angular.forEach($scope.add_characters, function(value, key) {
          if(value) {
            console.log(key);
          }
        });
      }
    }
  }]);