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
      }
      //Restangular.all('users')  // GET: /users
      //.then(function(users) {
      //  // returns a list of users
      //  $scope.user = users[0]; // first Restangular obj in list: { id: 123 }
      //})
    };
  }
]);
