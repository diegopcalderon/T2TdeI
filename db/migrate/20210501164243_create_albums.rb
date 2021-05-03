class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums, id: false do |t|
      t.string :id, primary_key: true
      t.references :artist, null: false, foreign_key: true, type: :string
      t.string :name
      t.string :genre
      t.string :artist_album
      t.string :tracks_album
      t.string :self_album

      t.timestamps
    end
  end
end
