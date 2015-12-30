class WelcomeController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: :text_to_email
  before_action :require_login, except: :text_to_email

  def index
  end

  def text_to_email
    email = EmailForm.new(sms_from: params['From'], sms_to: params['To'], body: params['Body'], account_id: params[:id])
    email.deliver
    respond_to do |format|
      format.xml
    end
  end

end
