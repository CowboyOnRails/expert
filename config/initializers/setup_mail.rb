ActionMailer::Base.delivery_method = :smtp #smtp #sendmail #test
ActionMailer::Base.smtp_settings = {

  :address              => "smtp.gmail.com",

  :port                 => 587,

  :domain               => "localhost",

  :user_name            => "victor.pukman",

  :password             => "04081990g",

  :authentication       => "plain",

  :enable_starttls_auto => true
}

ActionMailer::Base.sendmail_settings = {
  :location             =>"/usr/sbin/sendmail",
  :arguments            =>'-i -t'
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?