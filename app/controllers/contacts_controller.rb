class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact information for #{@contact.name} added!"
      redirect_to company_jobs_path(params[:contact][:company_id])
    else
      flash[:success] = "Contact was not added."
      redirect_to company_jobs_path(params[:contact][:company_id])
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :title, :email, :company_id)
  end
end
