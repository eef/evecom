angular.module('eveCert').factory('CharacterService', [
  'Restangular', function(Restangular) {
    Restangular.setBaseUrl("/api");
    var baseCharacters = Restangular.all("characters");
    return {
      active_character: function() {
        return baseCharacters.get("active");
      },
      all: function() {
        return baseCharacters.getList();
      },
      make_active: function(id) {
        baseCharacters = Restangular.all("characters");
        return baseCharacters.get("activate/"+id);
      },
      get_character: function(id) {
        baseCharacters = Restangular.all("characters");
        return baseCharacters.get(id);
      }
    };
  }
]);
