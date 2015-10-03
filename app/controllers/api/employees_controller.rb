class Api::EmployeesController < Api::ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  respond_to  :json

  def index
    @employee = Employee.all
    render json: @employee
  end

  def show
    render json: @employee
  end

  def new
    @employee = Employee.new
    render json: @employee
  end

  def edit
    render json: @employee
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      skills = skills_set(skills_params)
      @employee.skills = skills
      render json: @employee, status: :ok, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    render json: @employee
  end

  def search
    vacancy = Vacancy.find(params[:vacancy_id])
    full_matched, partially_matched = Employee.search_by(vacancy)
    render json: { vacancy: vacancy,
                   full_matched: full_matched.as_json(each_serializer: EmployeeSerializer),
                   partially_matched: partially_matched.as_json(each_serializer: EmployeeSerializer) }
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:id, :name, :job_search_status, :salary, :contact_info)
    end

    def skills_params
      params.fetch(:skills, []) || [] # not production ready :(
    end

    def skills_set(skills)
      skills.map do |skill|
        Skill.find_or_initialize_by(name: skill[:name])
      end.uniq
    end
end
