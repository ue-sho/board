# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
    has_many :board_tag_relations, dependent: :delete_all  # destroyメソッドのとき有効
    has_many :board, through: :board_tag_relations         # 中間テーブルを経由する事を示す
end
