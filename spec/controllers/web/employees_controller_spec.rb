require 'rails_helper'
RSpec.describe Web::EmployeesController, type: :controller do

  let(:employee_attrs) { attributes_for(:employee) }
  let(:new_employee_attrs) { attributes_for(:employee) }

  describe "GET #index" do
    it "list employees" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "show employee " do
      employee = Employee.create! employee_attrs
      get :show, id: employee.to_param
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "new employee" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "edit employee" do
      employee = Employee.create! employee_attrs
      get :edit, id: employee.to_param
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "creates a new Employee" do
      post :create, {:employee => employee_attrs}
      expect(response).to redirect_to(employees_url)
    end
  end

  describe "PUT #update" do
    it "updates the requested employee" do
      employee = Employee.create! employee_attrs
      put :update, id: employee.to_param, employee: new_employee_attrs
      expect(response).to redirect_to(employees_url)
    end
  end

  describe "DELETE #destroy" do
    it "destroys to the employee" do
      employee = Employee.create! employee_attrs
      delete :destroy, {:id => employee.to_param}
      expect(response).to redirect_to(employees_url)
    end
  end

end
