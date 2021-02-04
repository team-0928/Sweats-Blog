class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user, presence: true
  validates :post, presence: true
  validates_uniqueness_of :post_id, scope: :user_id
end
