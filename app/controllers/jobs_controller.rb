class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
<<<<<<< HEAD
    @category= Category.find_by(title: category_params[:category])
    @job = @company.jobs.new(job_params)
    @job.category = @category

=======
    @job = @company.jobs.new(job_params)
>>>>>>> contacts
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
<<<<<<< HEAD
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comment = Comment.new

=======
    @job = Job.find(params[:id])
>>>>>>> contacts
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
<<<<<<< HEAD
    @category= Category.find_by(title: category_params[:category])
    @job = Job.find(params[:id])
    @job.category = @category
=======
    @job = Job.find(params[:id])
>>>>>>> contacts
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path(@company, @job)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
<<<<<<< HEAD

  def category_params
    params.require(:job).permit(:category)
  end
=======
>>>>>>> contacts
end
