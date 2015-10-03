'use strict';

minihhControllers.controller('SkillsCtrl', ['$scope', 'Skill',
  function($scope, Skill) {
    $scope.allSkills = Skill.query();
    $scope.newSkill = '';

    $scope.addNewSkill = function() {
      $scope.skills.push({name: $scope.newSkill});
      $scope.newSkill = '';
    };
    $scope.addSkill = function(name) {
      $scope.skills.push({name: name});
    };

    $scope.removeSkill = function(index) {
      $scope.skills.splice(index, 1);
    };
  }]);
