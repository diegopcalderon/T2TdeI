class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, id: false do |t|
      t.string :id, primary_key: true
      t.references :album, null: false, foreign_key: true, type: :string
      t.string :name
      t.integer :duration
      t.integer :times_played
      t.string :artist_track
      t.string :album_track
      t.string :self_track

      t.timestamps
    end
  end
end
