class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin, :only => [:index, :show, :destroy]

  def index
    @users = User.find(:all, :order=>'name')
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    if !(current_user.has_role? :admin) and !(current_user == @user)
      redirect_to root_path
    end
  end

  def update
    if params[:cancel_button]
      redirect_to users_path
    else
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] = "User updated"
        redirect_to users_path, :notice => "User updated."
      else
        flash[:error] = "Unable to update user"
        render :action => :edit, :alert => "Unable to update user."
      end
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      flash[:notice] = "User deleted"
      redirect_to users_path, :notice => "User deleted."
    else
      flash[:error] = "Unable to delete user"
      redirect_to users_path, :notice => "Unable to delete user."
    end
  end
end