class Subscription < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_create :send_receipt_email

  private
  def send_receipt_email
    @user = User.find_by_email(self.user.email)
    @project = Project.find(self.project_id)

    ReceiptMailer.receipt_email(@user, @project).deliver_now
  end

end
