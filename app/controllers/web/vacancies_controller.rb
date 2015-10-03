class Web::VacanciesController < Web::ApplicationController
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /vacancies
  def index
    @vacancies = Vacancy.all
    respond_with @vacancies
  end

  # GET /vacancies/1
  def show
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
  end

  # GET /vacancies/1/edit
  def edit
  end

  # POST /vacancies
  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to vacancies_path
    else
      puts "*"*100
      @vacancy.errors.full_messages
      render action: :new
    end
  end

  # PATCH/PUT /vacancies/1
  def update
    if @vacancy.update(vacancy_params)
      redirect_to vacancies_path
    else
      render action: :new
    end
  end

  # DELETE /vacancies/1
  def destroy
    @vacancy.destroy
    redirect_to vacancies_url
  end

  private
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def vacancy_params
      params.require(:vacancy).permit(
        :name, :added_at, :expires_at, :salary, :contact_info,
        skills_attributes: [:id, :name, :_destroy]
      )
    end
end
