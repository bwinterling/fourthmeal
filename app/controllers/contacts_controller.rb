class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end


  def create
    @contact = Contact.new(contact_params)
    @contact.save

    redirect_to root_path
  end

  def show
    @contacts = Contact.all 
  end

  def new
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :comment)
  end
end
