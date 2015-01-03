angular.module('eveCert').factory('ApiCharacterService', [
  'Restangular', 'ApiCharacter', function(Restangular, ApiCharacter) {
    Restangular.setBaseUrl("/api");
    var baseCharacters = Restangular.all("eve/characters");
    return {
      characters: function(api_details){
        return baseCharacters.post(api_details);
      }
    };
  }
]);
