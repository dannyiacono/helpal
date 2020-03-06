class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :description
      t.date :due_date
      t.integer :status, default: 0
      t.string :title
      t.references :creator, foreign_key: { to_table: :users }
      t.references :helper, foreign_key: { to_table: :users }
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
