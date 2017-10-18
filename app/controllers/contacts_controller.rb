class ContactsController < ApplicationController

  def show
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    @contact.save

    redirect_to company_jobs_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end

end
