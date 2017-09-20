class User < ApplicationRecord
    attr_accessor :name, :email
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :name, presence: true
    validates :first_name, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
