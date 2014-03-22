class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :eye_color
      t.string :hair_color
      t.string :gender
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
