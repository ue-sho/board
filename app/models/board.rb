# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }   # presence : 未入力はだめ！の機能
  validates :title, presence: true, length: { maximum: 30 }  # validationはカスタムも作ることができる
  validates :body, presence: true, length: { maximum: 1000 }
end
