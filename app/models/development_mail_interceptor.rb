class DevelopmentMailInterceptor
    def self.delivering_email(message)
        message.subject = "#{message.to} #{message.subject}"
        message.to = "pop-corm2@ya.ru"
    end
end