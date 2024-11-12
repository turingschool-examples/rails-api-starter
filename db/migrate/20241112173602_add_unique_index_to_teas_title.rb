class AddUniqueIndexToTeasTitle < ActiveRecord::Migration[7.1]
  def change
    add_index :teas, :title, unique: true
  end
end
