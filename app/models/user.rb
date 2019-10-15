class User < ApplicationRecord
  before_create :add_remember_token
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
    
  def add_remember_token
    self.remember_digest =  Digest::SHA1.hexdigest SecureRandom.urlsafe_base64.to_s 
  end

  def authenticated? (remember_token)
    self.remember_digest == remember_token
  end

end
