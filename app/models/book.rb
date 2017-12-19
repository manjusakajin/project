class Book < ApplicationRecord
  has_many :reviews
  has_many :book_genres
  has_many :genres, through: :book_genres

  accepts_nested_attributes_for :genres

  validates :name, presence: true
  validates :introdution, presence: true
  validates :web_ratting, presence: true

  ratyrate_rateable "story", "art", "sound", "character", "enjoyment"

  def overall_ratings
    array = Rate.where rateable_id: id, rateable_type: "book"
    stars = array.map {|this| this.stars}
    star_count = stars.count
    stars_total = stars.inject(0) {|sum,x| sum + x}
    score = stars_total / (star_count.nonzero? || 1)
  end
end
