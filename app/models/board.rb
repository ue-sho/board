class Board < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 } # presence : 未入力だめ
  validates :title, presence: true, length: { maximum: 30 } # validationはカスタムも作ることができる
  validates :body, presence: true, length: { maximum: 1000 }
end
