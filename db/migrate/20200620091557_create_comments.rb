class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :board, foreign_key: true # ボードと関連付ける
      t.string :name, null: false  # 絶対に入力しないといけない
      t.text :comment, null: false

      t.timestamps
    end
  end
end
