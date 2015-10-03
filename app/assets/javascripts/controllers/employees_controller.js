'use strict';

minihhControllers.controller('EmployeesCtrl', ['$scope', 'Employee',
  function($scope, Employee) {
    $scope.employees = Employee.query();

    $scope.deleteEmployee=function(employee) {
      Employee.delete({ id: employee.id }, function() {
        $scope.employees.splice($scope.employees.indexOf(employee), 1);
      })
    }
  }]);

minihhControllers.controller('EmployeesNewCtrl',
  ['$scope', '$location', 'Employee', 'Skill',
  function($scope, $location, Employee, Skill) {
    $scope.employee = new Employee;
    $scope.skills = [];
    $scope.allSkills = Skill.query();
    $scope.persisted = false;

    $scope.submit_title = "Create employee";

    $scope.createEmployee=function(){
      $scope.employee.$save({}, success, failure);
    };
    var success = function(){
      $location.path("/employees");
    };
    var failure = function(response) {
      _.each(response.data, function(errors, key) {
        _.each(errors, function(e) {
          $scope.form[key].$dirty = true;
          $scope.form[key].$setValidity(e, false);
        });
      });
    };
    $scope.errorClass = function(name) {
      var s = $scope.form[name];
      return s.$invalid && s.$dirty ? "error" : "";
    };
    $scope.err_msg = function(name) {
      var result = new Array;
      _.each($scope.form[name].$error, function(key, value) {
        result.push(value);
      });
      return result;
    };
  }]);

minihhControllers.controller('EmployeesShowCtrl', ['$scope', '$routeParams', 'Employee',
  function($scope, $routeParams, Employee) {
    var employee = Employee.get({id: $routeParams.id}, function() {
      $scope.employee = employee;
    });
  }]);

minihhControllers.controller('EmployeesEditCtrl',
  ['$scope', '$routeParams','$location', 'Employee',
  function($scope, $routeParams, $location, Employee) {
    $scope.newSkill = '';
    $scope.submit_title = "Update employee"
    $scope.persisted = true;

    $scope.loadData = function() {
      Employee.get({id: $routeParams.id}).$promise.then(
        function(employee) {
          $scope.employee = employee;
          $scope.skills = $scope.employee.skills;
        });
    };
    $scope.loadData();

    $scope.updateEmployee=function(){
      $scope.employee.$update({}, success, failure);
    };
    var success = function(){
      $location.path("/employees");
    };
    var failure = function(response) {
      _.each(response.data, function(errors, key) {
        _.each(errors, function(e) {
          $scope.form[key].$dirty = true;
          $scope.form[key].$setValidity(e, false);
        });
      });
    };
    $scope.errorClass = function(name) {
      var s = $scope.form[name];
      return s.$invalid && s.$dirty ? "error" : "";
    };
    $scope.err_msg = function(name) {
      var result = new Array;
      _.each($scope.form[name].$error, function(key, value) {
        result.push(value);
      });
      return result;
    };
  }]);

minihhControllers.controller('EmployeesSearchCtrl',
  ['$scope', '$routeParams','$location', 'Vacancy', 'Employee',
  function($scope, $routeParams, $location, Vacancy, Employee) {
    $scope.loadData = function() {
      Vacancy.search({employee_id: $routeParams.id}).$promise.then(
        function(response) {
          $scope.employee = response.employee;
          $scope.full = response.full_matched;
          $scope.part = response.partially_matched;
        });
    };
    $scope.loadData();
  }]);
