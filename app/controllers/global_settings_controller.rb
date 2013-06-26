class GlobalSettingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin
  
  def index
    @settings = GlobalSettings.find(:all)
    @upload_types = UploadType.find(:all)
  end
  
  def edit
    @settings = GlobalSettings.find(params[:id])
  end

  def update
    @settings = GlobalSettings.find(params[:id])
    if params[:cancel_button]
      redirect_to global_settings_url
    else
      @settings.attributes=(params[:global_settings])
      if @settings.save
        flash[:notice] = "Global Settings updated"
        redirect_to global_settings_url
      else
        render :action => :edit
      end
    end
  end
end
