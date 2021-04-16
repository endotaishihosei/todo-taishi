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
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  validates :title, format: { with: /\A(?!\@)/ }

  validates :name, presence: true, length: {minimum: 3}

  validates :content, presence: true
  validates :content, uniqueness: true

  validate :validate_title_and_content_length

  belongs_to :user, dependent: :destroy

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  private 
  def validate_title_and_content_length
    char_count = self.title.length + self.content.length
    if char_count < 30
      errors.add(:content, '30文字以上で！')
    end
  end


end
