class PostImage < ApplicationRecord
    belongs_to :user
    attachment :image
    validates :image, presence: true
    has_many :post_comments, dependent: :destroy
    has_many :likes, dependent: :destroy
        def liked_by?(user)
          likes.where(user_id: user.id).exists?
        end
end
