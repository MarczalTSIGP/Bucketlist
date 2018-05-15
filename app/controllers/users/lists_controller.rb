class Users::ListsController < Users::BaseController

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      flash[:success] = "Lista criada com sucesso!"
      redirect_to users_list_path(@list)
    else
      flash[:error] = "Existem dados incorretos! Por favor verifique."
      render :new
    end
  end

  def show
    @list = current_user.lists.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
