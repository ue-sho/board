class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.string :body

      t.timestamps # created_at, updated_at が作成される
    end
  end
end
