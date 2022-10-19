class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[github]

  validates :name, presence: true, length: { maximum: 25 }

  after_create :send_notification

  def send_notification
    #UserMailer.welcome_email(self).deliver
    UserMailer.welcome_email(self).deliver_now
  end

  def self.find_for_github_oauth(access_token, signed_in_resourse = nil)
    data = access_token['info']
    user =
      User.where(provider: access_token['provider'], uid: access_token['uid'])
        .first

    if user
      return user
    else
      registered_user = User.where(email: data['email']).first
      if registered_user
        return registered_user
      else
        if data['name'].nil?
          name = data['nickname']
        else
          name = data['name']
        end

        user =
          User.create(
            name: name,
            provider: access_token['provider'],
            email: data['email'],
            uid: access_token['uid'],
            image: data['image'],
            password: Devise.friendly_token[0, 20]
          )
      end
    end
  end
end
