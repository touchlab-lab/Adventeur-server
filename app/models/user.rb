class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  
  
 
  
  
  def self.find_foursq_user(token)
    #fetch data from foursq
    #get user_id, email, name
    #find user by email
    #if exists return auth token
    #else create new user
    
    foursquare = Foursquare::Base.new(token)
    
    if user = User.where(:email => email]).first

    else
     
    end
    return user
  end
  
 
end
