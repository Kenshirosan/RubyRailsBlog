class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user

    validates :commenter, presence: true,
                        length: { minimum: 5 }
    validates :body, presence: true,
                        length: { minimum: 5 }
end
