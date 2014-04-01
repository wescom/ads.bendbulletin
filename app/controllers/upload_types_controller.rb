class UploadTypesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin, :only => [:index, :new, :edit, :update, :destroy]

  def index
    @upload_types = UploadType.find(:all, :order => 'tab_sort')
  end

  def show
    @upload_type = UploadType.find(params[:id])
  end

  def new
    @upload_type = UploadType.new
  end

  def create
    if params[:cancel_button]
      redirect_to global_settings_path
    else
      @upload_type = UploadType.new(params[:upload_type])
      if @upload_type.save
        flash[:notice] = "Upload Type Created"
        redirect_to global_settings_path
      else
        flash[:error] = "Upload Type Creation Failed"
        render :action => :new
      end
    end    
  end

  def edit
    @upload_type = UploadType.find(params[:id])
  end

  def update
    if params[:cancel_button]
      redirect_to global_settings_path
    else
      @upload_type = UploadType.find(params[:id])
      if @upload_type.update_attributes(params[:upload_type])
        flash[:notice] = "Upload Type Updated"
        redirect_to global_settings_path
      else
        flash[:error] = "Upload Type Creation Failed"
        render :action => :edit
      end
    end
  end

  def destroy
    @upload_type = UploadType.find(params[:id])
    if @upload_type.destroy
      flash[:notice] = "Upload Type Killed!"
      redirect_to global_settings_path
    else
      flash[:error] = "Upload Type Deletion Failed"
      redirect_to global_settings_path
    end
  end
end
