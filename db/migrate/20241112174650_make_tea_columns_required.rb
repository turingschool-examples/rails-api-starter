class MakeTeaColumnsRequired < ActiveRecord::Migration[7.1]
  def change
    change_column_null :teas, :title, false
    change_column_null :teas, :description, false
    change_column_null :teas, :temp, false
    change_column_null :teas, :brew_time, false
    change_column_null :teas, :price, false
    change_column_null :teas, :image, false
  end
end