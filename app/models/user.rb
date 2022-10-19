class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 25}

  after_create :send_notification 

  def send_notification
    #UserMailer.welcome_email(self).deliver
    UserMailer.welcome_email(self).deliver_now
  end

end
