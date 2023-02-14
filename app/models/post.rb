class Post < ApplicationRecord
  validates :brand,presence: true, length: { maximum: 20 }
  validates :frame,presence: true, length: { maximum: 20 }
  validates :user_id, presence: true

  belongs_to :user

  has_one :part, dependent: :destroy
  accepts_nested_attributes_for :part
  has_many :likes, dependent: :destroy

  has_many_attached :images

  def liked_by?(user)
      likes.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(brand frame)
  end
end
