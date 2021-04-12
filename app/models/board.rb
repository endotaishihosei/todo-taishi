class Board < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :name, presence: true, length: {minimum: 3}
  validates :content, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

end
