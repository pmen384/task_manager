class UsersController < ApplicationController
  before_action :collect_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @task = current_user.tasks.build if logged_in?
    #@task = current_user.tasks.build if logged_in?
    @tasks = @user.tasks.order(created_at: :desc)
    #@task = User.tasks.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "アカウント情報を編集しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :targettime)
  end
  
  def collect_user
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
end
