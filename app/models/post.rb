class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true, length: { maximum: 50 }
  # validates :image, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :user_id, presence: true

  # def user
  #   User.find(self.user_id)
  # end
end
