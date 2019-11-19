class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true
    validates :username, length: {minimum: 2}
    validates :password, length: { in: 6..20 }
    validates :password_confirmation, presence: true
    
    
end
