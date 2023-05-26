class TestMailer < ApplicationMailer
    def welcome_email
        @message = params[:message]

        mail(to: params[:target], subject: "Bem vindo ao rarobank")
    end
end
