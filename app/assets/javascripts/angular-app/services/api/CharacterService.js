angular.module('eveCert').factory('ApiCharacterService', [
  'Restangular', 'ApiCharacter', function(Restangular, ApiCharacter) {
    Restangular.setBaseUrl("/api");
    return {
      characters: function(api_details){
        var baseCharacters = Restangular.all("eve/characters");
        return baseCharacters.post(api_details);
      },

      add_character: function(character_details) {
        baseCharacters = Restangular.all("characters");
        return baseCharacters.post(character_details);
      },

      active_character: function() {
        baseCharacters = Restangular.all("characters");
        return baseCharacters.get("active");
      }
    };
  }
]);
