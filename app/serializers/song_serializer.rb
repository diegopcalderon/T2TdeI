class SongSerializer < ActiveModel::Serializer
  attributes :id, :album_id, :name, :duration, :times_played
  attribute :artist_track, key: :artist
  attribute :album_track, key: :album
  attribute :self_track, key: :self
end
