class HomeController < ApplicationController
  def index
    if user_signed_in?
      @global_settings = GlobalSettings.all
    else
      redirect_to new_user_session_path
    end
  end
end
