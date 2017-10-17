class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job= Job.find(params[:job_id])
    @contact = Contact.new(contact_params)
    @comment.company_id = params[:company_id]
    @contact.save

    redirect_to company_job_path(@company, @job)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end
end
