class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_requested(@contact, params[:restaurant_id]).deliver
      flash[:notice] = "Thanks for your message!
        We'll get back to you as soon as possible."
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.find_by(:slug => params[:restaurant_id])
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :comment)
  end
end
