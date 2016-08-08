class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :make
      t.string :color
      t.integer :year

      t.timestamps null: false
    end
  end
end
