class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.integer :age
      t.string :albums_artist
      t.string :tracks_artist
      t.string :self_artst

      t.timestamps
    end
  end
end
