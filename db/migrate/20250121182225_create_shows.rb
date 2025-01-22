class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.string :artist
      t.string :genre
      t.string :location
      t.datetime :date
      t.datetime :time

      t.timestamps
    end
  end
end
