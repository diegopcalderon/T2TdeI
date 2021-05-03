class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :name, :genre
  attribute :artist_album, key: :artist
  attribute :tracks_album, key: :tracks
  attribute :self_album, key: :self
end
