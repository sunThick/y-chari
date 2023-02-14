class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :portrailt

  validates :username, presence: true, uniqueness: true, length: { maximum: 10 }, format: {with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字で入力してください"}
  validates :name, presence: true, length: { maximum: 15 }
  validates :description, length: { maximum: 20 }





end
