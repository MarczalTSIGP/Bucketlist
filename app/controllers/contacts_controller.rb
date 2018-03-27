class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      @contact = Contact.new
      flash[:success] = 'Mensagem enviada com sucesso!'
    else
      flash[:error] = 'Existem dados incorretos!'
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
