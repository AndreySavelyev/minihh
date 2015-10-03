class Web::SkillsController < Web::ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /skills
  def index
    @skills = Skill.all
    respond_with @skills
  end

  # GET /skills/1
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skills_path
    else
      render action: :new
    end
  end

  # PATCH/PUT /skills/1
  def update
    if @skill.update(skill_params)
      redirect_to skills_path
    else
      render action: :new
    end
  end

  # DELETE /skills/1
  def destroy
    @skill.destroy
    redirect_to skills_url
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(
        :name, :added_at, :expires_at, :salary, :contact_info,
        skills_attributes: [:id, :name, :_destroy]
      )
    end
end
