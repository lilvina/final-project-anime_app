class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :genre
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
