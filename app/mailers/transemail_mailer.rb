class TransemailMailer < ApplicationMailer
    default from: "tramail910@gmail.com"

    def email(email)
        @email=email
        mail(to: @email.to, subject: @email.subject)
    end
end
