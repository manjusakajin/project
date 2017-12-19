class Genre < ApplicationRecord
  has_many :book_genres
  has_many :book, through: :book_genres
end
