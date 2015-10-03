'use strict';

minihhControllers.controller('VacanciesCtrl', ['$scope', 'Vacancy',
  function($scope, Vacancy) {
    $scope.vacancies = Vacancy.query();

    $scope.deleteVacancy=function(vacancy) {
      Vacancy.delete({ id: vacancy.id }, function() {
        $scope.vacancies.splice($scope.vacancies.indexOf(vacancy), 1);
      })
    }
  }]);

minihhControllers.controller('VacanciesNewCtrl',
  ['$scope', '$location', 'Vacancy', 'Skill',
  function($scope, $location, Vacancy, Skill) {
    $scope.vacancy = new Vacancy;
    $scope.skills = [];
    $scope.allSkills = Skill.query();
    $scope.persisted = false;

    $scope.submit_title = "Create vacancy";

    $scope.createVacancy=function(){
      $scope.vacancy.$save(function(){
        $location.path("/vacancies");
      });
    };
  }]);

minihhControllers.controller('VacanciesShowCtrl', ['$scope', '$routeParams', 'Vacancy',
  function($scope, $routeParams, Vacancy) {
    var vacancy = Vacancy.get({id: $routeParams.id}, function() {
      $scope.vacancy = vacancy;
    });
  }]);

minihhControllers.controller('VacanciesEditCtrl',
  ['$scope', '$routeParams','$location', 'Vacancy',
  function($scope, $routeParams, $location, Vacancy) {
    $scope.newSkill = '';
    $scope.submit_title = "Update vacancy"
    $scope.persisted = true;

    $scope.loadData = function() {
      Vacancy.get({id: $routeParams.id}).$promise.then(
        function(vacancy) {
          $scope.vacancy = vacancy;
          $scope.skills = $scope.vacancy.skills;
        });
    };
    $scope.loadData();

    $scope.updateVacancy=function(){
      $scope.vacancy.$update(function(){
        $location.path("/vacancies");
      });
    };
  }]);

minihhControllers.controller('VacanciesSearchCtrl',
  ['$scope', '$routeParams','$location', 'Vacancy', 'Employee',
  function($scope, $routeParams, $location, Vacancy, Employee) {
    $scope.loadData = function() {
      Employee.search({vacancy_id: $routeParams.id}).$promise.then(
        function(response) {
          $scope.vacancy = response.vacancy;
          $scope.full = response.full_matched;
          $scope.part = response.partially_matched;
        });
    };
    $scope.loadData();
  }]);
