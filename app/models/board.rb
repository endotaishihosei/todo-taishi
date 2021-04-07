class Board < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :name, presence: true, length: {minimum: 3}
  validates :content, presence: true


end
