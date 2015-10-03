'use strict';

/* Services */

var minihhServices = angular.module('minihhServices', ['ngResource']);

minihhServices.factory('Vacancy', ['$resource',
  function($resource){
    return $resource('/api/vacancies/:id:search.json', { id: '@id' },
      {
        update: { method: 'PUT' },
        search: { method: 'GET', params: { search: 'search' } }
      });
  }]);

minihhServices.factory('Employee', ['$resource',
  function($resource){
    return $resource('/api/employees/:id:search.json', { id: '@id' },
      {
        update: { method: 'PUT' },
        search: { method: 'GET', params: { search: 'search' } }
      });
  }]);

minihhServices.factory('Skill', ['$resource',
  function($resource){
    return $resource('/api/skills/:id.json', { id: '@id' }, {
      update: { method: 'PUT' }
    });
  }]);
