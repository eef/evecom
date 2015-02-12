app.directive('ngAvatar', function() {
  return {
    restrict: 'E',
    replace: true,
    template: '<img class="{{classes}} avatar-{{size}}" ng-src="{{url}}" />',
    link: function(scope, elem, attrs) {
      var unWatch = scope.$watch("character", function(v){
        if(v){
          unWatch();
          init();
        }
      });
      function init(){
        sizes = {
          'small':'64',
          'medium':"128",
          'large': "256"
        }
        var type = attrs.avatarType;
        scope.classes = attrs.avatarClasses;
        var id = attrs.avatarId;
        scope.size = attrs.avatarSize;
        var baseUrl = "http://image.eveonline.com/";
        switch(type){
          case "character":
            scope.url = baseUrl + "Character/"+id+"_"+sizes[scope.size]+".jpg";
        }
      }
    }
  }
});