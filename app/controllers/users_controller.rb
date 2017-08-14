class UsersController < ApplicationController

  before_action :require_token, only: [:validate]

  def validate
    render :json => @current_user.json_hash
  end

  def index
    p "in users_controller index"
    #@user = User.all
    render :json => User.all.as_json
  end

  def show
    @user = User.find(params[:id])
    render :json => @user.as_json
  end

  def new
    p "in users new"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.valid?
        @user.save()
        render :json => @user.json_hash
      else
        render status: :bad_request, :json => {
        :errors => @user.errors.messages
      }
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_url
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
