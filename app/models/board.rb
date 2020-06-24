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
#ß
class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all  # dependentが指定された時、関連データが削除された場合、同じ様に削除される
  has_many :board_tag_relations, dependent: :delete_all
  has_many :tags, through: :board_tag_relations

  validates :name, presence: true, length: { maximum: 10 }  # presence : 未入力はだめ！の機能
  validates :title, presence: true, length: { maximum: 30 }  # validationはカスタムも作ることができる
  validates :body, presence: true, length: { maximum: 1000 }
end
