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
    @list = current_user.lists.find_by(id: params[:id]) ||
            current_user.shared_lists.find(params[:id])

    @tasks_completed = @list.tasks.completed
    @tasks_uncompleted = @list.tasks.uncompleted
  end

  def share
    @list = current_user.lists.find(params[:id])
  end

  def share_with
    @user = User.find(params[:user_id])
    @list = current_user.lists.find(params[:id])

    @list.shared_users << @user
    redirect_to users_share_list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
