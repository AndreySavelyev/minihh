class Api::VacanciesController < Api::ApplicationController
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]
  respond_to  :json

  def index
    @vacancies = Vacancy.all
    render json: @vacancies
  end

  def show
    render json: @vacancy
  end

  def new
    @vacancy = Vacancy.new
    render json: @vacancy
  end

  def edit
    render json: @vacancy
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.save
    render json: @vacancy
  end

  def update
    if @vacancy.update(vacancy_params)
      skills = skills_set(skills_params)
      @vacancy.skills = skills
    end
    render json: @vacancy
  end

  def destroy
    @vacancy.destroy
    render json: @vacancy
  end

  def search
    employee = Employee.find(params[:employee_id])
    full_matched, partially_matched = Vacancy.search_by(employee)
    render json: { employee: employee,
                   full_matched: full_matched.as_json(each_serializer: VacancySerializer),
                   partially_matched: partially_matched.as_json(each_serializer: VacancySerializer) }
  end

  private
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def vacancy_params
      params.require(:vacancy).permit(:name, :added_at, :expires_at, :salary, :contact_info)
    end

    def skills_params
      params.fetch(:skills, []) || []
    end

    def skills_set(skills)
      skills.map do |skill|
        Skill.find_or_initialize_by(name: skill[:name])
      end.uniq
    end
end
