class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable
  
  has_many :adventures

                  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :authentication_token
  

  def self.find_foursq_user(token)
    response = HTTParty.get("https://api.foursquare.com/v2/users/self?oauth_token=#{token}")
    json = JSON.parse(response.body)
    if (json["meta"]["code"] != 200)
      return nil
    end
    user = json["response"]["user"]
    id = user["id"]
    email = user["contact"]["email"]
    name = user["firstName"]
    if (email.nil?)
      email = "foursq_user_#{user.id}@adventeur.co"
    end
    
    if user = User.where(:email => email).first
      return user
    else
     user = User.create!({:email => email, :password => Devise.friendly_token[0,20], :name => name, :foursq_token => token, :foursq_id => id}) 
    end
    return user
  end
  
 
end
