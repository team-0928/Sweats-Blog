class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :image,
    content_type: { in: %w[image/jpeg image/gif image/png],
      message: "有効なファイルを選択してください" },
    size:         { less_than: 5.megabytes,
      message: "データサイズは5MB以下のものにしてください" }
  validates :user_id, presence: true

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [300, 300])
  end

  # def user
  #   User.find(self.user_id)
  # end
end
