class EmailForm < MailForm::Base

  attributes :sms_to, :validate => true
  attributes :sms_from, :validate => true
  attributes :body, :validate => true
  attributes :account_id, :validate => true

  def headers
    {
      :subject => "New Text Message",
      :to => get_email,
      :from => "<info@jillsoffice.com>"
    }
  end

  private

  def get_email
    Account.find(account_id).email
  end

end
