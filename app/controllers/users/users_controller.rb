class Users::UsersController < ApplicationController
  def index
    @users = User.search(params[:query])
    render json: @users.map {|u| {data: u.id, value: u.name} }
  end
end
