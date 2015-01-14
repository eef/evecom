angular.module('eveCert')
  .controller("EveApiCtrl", ['$scope', 'ApiCharacterService', '$rootScope', '$timeout', function($scope, ApiCharacterService, $rootScope, $timeout) {
    $scope.showCharacters = false;
    $scope.addCharacterForm = {};
    $scope.addCharacterForm.key_id = "4018326";
    $scope.addCharacterForm.verification_code = "l93QPrtiBYCESif1uIleALsCa5XdMuN0h0MhXOKCaSAZ1n8M2mvZKCha3iedryoF";
    $scope.getCharacters = function(accountForm){
      ApiCharacterService.characters(accountForm).then(function(res){
        $scope.characters = res.eve;
        if($scope.characters.length > 0) {
          $scope.showCharacters = true;
        } else {
          $rootScope.showToast("No characters!");
        }
      }, function(){
        $rootScope.showToast("Unable to retrieve characters!");
      });
    }

    $scope.addCharacter = function(character_id) {
      //$timeout(function(){
      //  $scope.add_characters[character_id] = "added";
      //  $rootScope.showToast("Added!");
      //  $rootScope.loading = false;
      //  if((_.size(angular.copy($scope.add_characters))) === (_.size(angular.copy($scope.characters)))) {
      //    $scope.showCharacters = false;
      //    $scope.addCharacterForm.key_id = "";
      //    $scope.addCharacterForm.verification_code = "";
      //    $scope.add_characters = {};
      //    $scope.characters = {};
      //  }
      //}, 1000);
      //id: params[:eve][:key_id], vcode: params[:eve][:verification_code]
      var character_details = {
        "eve":{
          "verification_code":$scope.addCharacterForm.verification_code,
          "key_id":$scope.addCharacterForm.key_id,
          "character_id": character_id
        }
      };
      ApiCharacterService.add_character(character_details).then(function(res){
        $scope.add_characters[res.character_id] = "added"
        $rootScope.$broadcast('refresh_active_character', 'Character added');
      }, function(){
        console.log(res, "failed");
      });

      //$scope.add_characters[character_id] = false;
      //if(_.size(angular.copy($scope.add_characters)) > 0) {
      //  angular.forEach($scope.add_characters, function(value, key) {
      //    if(value) {
      //      console.log(key);
      //    }
      //  });
      //}
    }
  }]);
