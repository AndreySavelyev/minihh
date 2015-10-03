require 'rails_helper'
RSpec.describe Api::VacanciesController, type: :controller do

  let(:vacancy_attrs) { attributes_for(:vacancy) }
  let(:new_vacancy_attrs) { attributes_for(:vacancy) }

  describe "GET #index" do
    it "list vacancies" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "show vacancy " do
      vacancy = Vacancy.create! vacancy_attrs
      get :show, id: vacancy.to_param
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "edit vacancy" do
      vacancy = Vacancy.create! vacancy_attrs
      get :edit, id: vacancy.to_param
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "creates a new Vacancy" do
      post :create, {:vacancy => vacancy_attrs}
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    it "updates the requested vacancy" do
      vacancy = Vacancy.create! vacancy_attrs
      put :update, id: vacancy.to_param, vacancy: new_vacancy_attrs
      expect(response).to be_success
    end
  end

  describe "DELETE #destroy" do
    it "destroys to the vacancy" do
      vacancy = Vacancy.create! vacancy_attrs
      delete :destroy, {:id => vacancy.to_param}
      expect(response).to be_success
    end
  end

end
