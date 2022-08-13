class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable
  
  validates_presence_of     :email # optional
  validates_presence_of     :name # required
  validates_uniqueness_of   :name # required

  def self.find_for_google_0auth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first

    if user
      return user
    else
      registered_user = User.where(:email => access_token.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name: data["name"],
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid,
          password: Divise.friendly_token[0, 20]




        )
      end
    end
  end


       
end
