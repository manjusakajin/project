class Review < ApplicationRecord
  has_many :comments

  belongs_to :user
  belongs_to :book

  validates :user, presence: true
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
