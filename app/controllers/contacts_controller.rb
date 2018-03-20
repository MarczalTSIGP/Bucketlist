class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:success] = 'Mensagem enviada com sucesso!'
      redirect_to root_path
    else
      flash[:error] = 'Existem dados incorretos!'
      render "home/index"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
