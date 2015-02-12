var countUpModule = angular.module('countUp', []).directive('countUp', ['$compile',function($compile,$timeout) {
  return {
    restrict: 'E',
    replace: false,
    scope: {
      spPerSecond: "=spPerSecond",
      trainedFor: "=trainedFor",
      startFrom: "=startFrom"
    },
    controller: ['$scope', '$element', '$attrs', '$timeout', function ($scope, $element, $attrs, $timeout) {

      var alreadyTrained = $scope.trainedFor * $scope.spPerSecond;

      $scope.incr = parseFloat($scope.spPerSecond);

      $scope.num = parseFloat($scope.startFrom) + parseFloat(alreadyTrained);

      if (typeof String.prototype.trim !== 'function') {
        String.prototype.trim = function () {
          return this.replace(/^\s+|\s+$/g, '');
        };
      }

      function format_num(num) {
        var parts = String( num ).replace(/[^\d.]-/g,'').split('.');
        var arr = parts[0].split('').reverse();

        var str = '';

        for( var i = 0; arr.length; i++ ) {
          if( i && i%3 == 0 && arr[0] != '-' ) {
            str  = ',' + str ;
          }

          str  = arr.shift() + str ;
        }

        return str;
      }

      setInterval(function(){
        $scope.num += $scope.incr;
        $element[0].textContent = format_num($scope.num) + " SP";
      }, 1000);

      //
      //var i=$scope.countFrom;
      //function timeloop () {
      //  setTimeout(function () {
      //    $scope.millis += $scope.tickAmount;
      //    $scope.$digest();
      //    i++;
      //    if (i<$scope.countTo) {
      //      timeloop();
      //    }
      //  }, $scope.interval)
      //}
      //timeloop();
    }]
  }}]);

if (typeof module !== "undefined" && typeof exports !== "undefined" && module.exports === exports){
  module.exports = countUpModule;
}