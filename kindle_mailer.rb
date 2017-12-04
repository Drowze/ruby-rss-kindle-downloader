require 'mail'

class KindleMailer
  def initialize(kindle_address:)
    @kindle_address = kindle_address
  end

  def send_mail(files:)
    mail = Mail.new
    mail.to = @kindle_address
    mail.from = "Kindle Mailer <#{ENV['GMAIL_SMTP_USER']}>"
    mail.add_file files.first
    client.deliver!(mail)
  end

  private

  def client
    @client ||= Mail.defaults do
      delivery_method :smtp, { 
        :address => 'smtp.gmail.com',
        :port => 587,
        :user_name => ENV['GMAIL_SMTP_USER'],
        :password => ENV['GMAIL_SMTP_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end
  end
end

