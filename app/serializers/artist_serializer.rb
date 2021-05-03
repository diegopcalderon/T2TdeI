class ArtistSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :age
  attribute :albums_artist, key: :albums
  attribute :tracks_artist, key: :tracks
  attribute :self_artst, key: :self
end
