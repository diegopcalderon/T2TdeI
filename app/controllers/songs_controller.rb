class SongsController < ApplicationController
  protect_from_forgery with: :null_session

  def create_tracks
    
    if params[:name] != "" && params[:duration] != "" && params[:times_played] != ""
      album_id = params[:id]
      albumnes = Album.all.ids
      if albumnes.include?(album_id)  
        name_track = params[:name].strip
        duration_track = params[:duration].to_i
        times_played = params[:times_played].to_i
        id_track = Base64.encode64(name_track).strip
        tracks = Song.all.ids
        if tracks.include?(id_track)
          render json: Song.find(id_track), status: 409
        else
          track = Song.new
          track.id = id_track
          track.album_id = album_id
          track.name = name_track
          track.duration = duration_track
          track.times_played = times_played
          track.artist_track = "artists/" + Album.find(album_id).artist_id
          track.album_track = "albums/" + album_id
          track.self_track = "tracks/" + id_track
          if track.save
            render json: track
          end          
        end
      else
        render json: {}, status: 422
      end
    else
      render json: {}, status: 400
    end
  end

  def index
    songs = Song.all
    render json: songs, status: 201
  end

  def show
    only_song = Song.find(params[:id])
    if only_song
      render json: only_song, status: 200
    else
      render status: 404
    end
  end

  def show_album_tracks
    tracks = Album.find(params[:id]).songs
    if tracks
      render json: tracks, status: 200
    else
      render status: 404
    end
  end 

  def show_artist_tracks
    albums = Artist.find(params[:id]).albums
    if albums
      tracks = []
      for album in albums
        for song in  album.songs
          tracks << song
        end
      end
      render json: tracks, status: 200
    else
      render status: 404
    end
  end 

  def play
    tracks = Song.all.ids
    if tracks.include?(params[:id])
      track = Song.find(params[:id])
      track.times_played += 1
      track.save
      render json: {}, status: 200
    else
      render json: {}, status: 404
    end
  end

  def delete
    tracks = Song.all.ids
    if tracks.include?(params[:id])
      song_delete = Song.find(params[:id])
      song_delete.destroy
      render json: {}, status: 204
    else
      render json: {}, status: 404
    end
  end
end
