class WelcomeController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: :text_to_email

  def index
  end

  def email
    email = EmailForm.new(email_to: params[:email_to], from: params[:from], body: params[:body], sms_to: params[:sms_to], sms_from: params[:sms_from])
    email.deliver
    redirect_to root_path
  end

  def text_to_email
    email = EmailForm.new(sms_from: params['From'], sms_to: params['To'], body: params['Body'])
    email.deliver
    respond_to do |format|
      format.xml
    end
  end

end
