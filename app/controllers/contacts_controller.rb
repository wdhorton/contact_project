class ContactsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @contacts = user.contacts + user.shared_contacts
    render json: @contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    contact = Contact.update(params[:id], contact_params)
    if contact
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :bad_request
      )
    end
  end

  def destroy
    contact = Contact.destroy(params[:id])
    render json: contact
  end

  def favorites
    @contacts = Contact.where(user_id: params[:user_id], favorite: true)
    render json: @contacts
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
