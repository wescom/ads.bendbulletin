class EmailTextsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin
  
  def index
    @email_texts = EmailText.find(:all, :order=>'name,email_type')
  end
  
  def edit
    @email_text = EmailText.find(params[:id])
  end

  def update
    @email_text = EmailText.find(params[:id])
    if params[:cancel_button]
      redirect_to email_texts_url
    else
      @email_text.attributes=(params[:email_text])
      if @email_text.save
        flash[:notice] = "Email Text Updated"
        redirect_to email_texts_url
      else
        flash[:notice] = "Email Text Updated Failed"
        render :action => :edit
      end
    end
  end
end
