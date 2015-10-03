class Api::SkillsController < Api::ApplicationController
  respond_to  :json

  def index
    @skills = Skill.all
    render json: @skills
  end
end
