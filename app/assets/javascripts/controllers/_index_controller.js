'use strict';

/* Controllers */

var minihhControllers = angular.module('minihhControllers', ['ngResource']);

minihhControllers.controller('IndexCtrl', ['$scope', function($scope) {
  console.log('Welcome to index!');
}]);
