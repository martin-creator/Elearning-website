class ReceiptMailer < ApplicationMailer
    def receipt_email(user, project)
      @user = user
      @project = project
      mail(to: @user.email, subject: 'Thanks for making a payment to Eagles Code')
    end
  end
  