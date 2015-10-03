class Web::EmployeesController < Web::ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /employees
  def index
    @employees = Employee.all
    respond_with @employees
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render action: :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render action: :new
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(
        :name, :job_search_status, :salary, :contact_info,
        skills_attributes: [:id, :name, :_destroy]
      )
    end
end
