class EmailForm < MailForm::Base
  include SendGrid

  attributes :sms_to, :validate => true
  attributes :sms_from, :validate => true
  attributes :body, :validate => true

  def headers
    {
      :subject => "New Text Message",
      :to => 'mjmthurgood@gmail.com',
      :from => "<info@jillsoffice.com>"
    }
  end
end
