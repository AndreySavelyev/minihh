require 'rails_helper'
RSpec.describe Api::SkillsController, type: :controller do

  before do
    create_list(:skill, 2)
  end

  describe "GET #index" do
    it "return skills" do
      get :index
      expect(response).to be_success
    end
  end
end
