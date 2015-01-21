app.directive('ngAvatar', function() {
  return {
    restrict: 'E',
    replace: true,
    template: '<img class="avatar-medium" ng-src="{{url}}" />',
    link: function(scope, elem, attrs) {
      var aType = attrs.avatarType;
      var aId = attrs.avatarId;
      var baseUrl = "http://image.eveonline.com/";
      switch(aType){
        case "character":
          scope.url = baseUrl + "Character/"+aId+"_256.jpg";
      }
    }
  }
});

// <img ng-src="http://image.eveonline.com/Character/{{character.character_id}}_256.jpg" class="avatar-medium" alt="{{character.name}}">