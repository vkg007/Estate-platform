class UserMailer < ApplicationMailer
  default from: 'vivekrails007@gmail.com'
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Estate.com')
  end

  def contract_email(contract)
    @contract = contract
    mail(to: @contract.user.email, subject: 'Contract Agreement')
  end
end
