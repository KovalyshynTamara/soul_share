class Admin::UsersController < ApplicationController
  before_action :require_admin, except: [ :stop_impersonating ]

  def index
    @users = collection
  end

  def show
    @user = resource
  end

  def edit
    @user = resource
  end

  def update
    @user = resource
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @user = resource
    @user.destroy
    redirect_to admin_users_path, notice: "User deleted successfully."
  end

  def impersonate
    user = resource
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end
  private

  def user_params
    if current_user.admin?
      params.require(:user).permit(:name, :email, :admin)
    else
      params.require(:user).permit(:name, :email)
    end
  end

  def require_admin
    unless current_user&.admin? || impersonating?
      redirect_to root_path, alert: "Access denied"
    end
  end

  def collection
    User.all
  end

  def resource
    User.find(params[:id])
  end
end
