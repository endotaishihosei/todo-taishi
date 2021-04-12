# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :title, format: { with: /\A(?!\@)/ }

  validates :name, presence: true, length: {minimum: 3}

  validates :content, presence: true
  validates :content, uniqueness: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

end
