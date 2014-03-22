class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :location
      t.string :career
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :eye_color
      t.string :hair_color
      t.string :gender
      t.string :img
      t.timestamps
    end
  end
end
