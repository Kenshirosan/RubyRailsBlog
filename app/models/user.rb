class User < ApplicationRecord
    # attr_accessor :name, :email, :password
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness:  { case_sensitive: false }

    has_secure_password
    validates :password, confirmation:true, presence: true, length: { minimum: 6 }
end
