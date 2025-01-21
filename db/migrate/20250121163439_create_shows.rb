class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :artist, null: false
      t.string :location, null: false
      t.date :date, null: false
      t.time :time, null: false

      t.timestamps
    end
  end
end