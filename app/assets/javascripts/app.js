'use strict';

/* App Module */

var minihhApp = angular.module('minihhApp', [
  'templates',
  'ngRoute',
  'ngResource',
  'minihhControllers',
  'minihhServices'
]);

minihhApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: '/assets/templates/index.html',
        controller: 'IndexCtrl'
      }).
      when('/vacancies', {
        templateUrl: '/assets/templates/vacancies/index.html',
        controller: 'VacanciesCtrl'
      }).
      when('/vacancies/new', {
        templateUrl: '/assets/templates/vacancies/new.html',
        controller: 'VacanciesNewCtrl'
      }).
      when('/vacancies/:id/search', {
        templateUrl: '/assets/templates/vacancies/search.html',
        controller: 'VacanciesSearchCtrl'
      }).
      when('/vacancies/:id/show', {
        templateUrl: '/assets/templates/vacancies/show.html',
        controller: 'VacanciesShowCtrl'
      }).
      when('/vacancies/:id/edit', {
        templateUrl: '/assets/templates/vacancies/edit.html',
        controller: 'VacanciesEditCtrl'
      }).
      when('/employees', {
        templateUrl: '/assets/templates/employees/index.html',
        controller: 'EmployeesCtrl'
      }).
      when('/employees/new', {
        templateUrl: '/assets/templates/employees/new.html',
        controller: 'EmployeesNewCtrl'
      }).
      when('/employees/:id/search', {
        templateUrl: '/assets/templates/employees/search.html',
        controller: 'EmployeesSearchCtrl'
      }).
      when('/employees/:id/show', {
        templateUrl: '/assets/templates/employees/show.html',
        controller: 'EmployeesShowCtrl'
      }).
      when('/employees/:id/edit', {
        templateUrl: '/assets/templates/employees/edit.html',
        controller: 'EmployeesEditCtrl'
      })
  }]);
