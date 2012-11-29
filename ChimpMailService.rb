require 'action_mailer'
CONFIG = YAML.load(File.read('./config.yml'))
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.view_paths= File.dirname(__FILE__)

ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      'apies',
    :password =>       CONFIG['api_key'],
    :domain =>         'localhost',
    :authentication => :plain
}


class MoveChimpMailer < ActionMailer::Base

  def invite_email(params)
    @text = params[:text]

    mail(
      :to      =>  params[:to], # "alan.lee.pies@gmail.com",
      :from    => "move@movetest.com",
      :subject => params[:subject]
    ) do |format|
      #format.txt
      format.html
    end
  end
end

#email = MoveChimpMailer.invite_email
#puts email
#email.deliver