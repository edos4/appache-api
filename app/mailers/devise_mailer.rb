class DeviseMailer < Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    mail = super
    mail.subject = "Account Confirmation"
    mail
  end
end