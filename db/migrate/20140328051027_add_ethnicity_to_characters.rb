class AddEthnicityToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :ethnicity, :text
  end
end
