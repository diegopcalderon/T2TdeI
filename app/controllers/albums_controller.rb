class AlbumsController < ApplicationController
  protect_from_forgery with: :null_session

  def create_album
    if params[:name] != "" && params[:genre] != ""
      artist_id = params[:id]
      artistas = Artist.all.ids
      if artistas.include?(artist_id)
        name_album = params[:name].strip
        genre_album = params[:genre].strip
        id = Base64.encode64(name_album).strip
        albumnes = Album.all.ids
        if albumnes.include?(id)
          render json: Album.find(id), status: 409
        else
          album = Album.new
          album.id = id
          album.artist_id = artist_id
          album.name = name_album
          album.genre = genre_album
          album.artist_album = "artists/" + artist_id
          album.tracks_album = "albums/" + id + "/tracks"
          album.self_album = "albums/" + id
        
          if album.save
            render json: album, status: 201
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
    albums = Album.all
    render json: albums, status: 200
  end

  def show
    album_id = Album.find(params[:id])
    if album_id
      render json: album_id, status: 200
    else
      render status: 404
    end
  end

  def show_albums
    albumnes = Artist.find(params[:id]).albums
    if albumnes  
      render json: albumnes, status: 200
    else
      render status: 404
    end
  end 

  def play
    albumnes = Album.all.ids
    if albumnes.include?(params[:id])
      tracks = Album.find(params[:id]).songs
      for track in tracks
        track.times_played +=1
        track.save
      end
      render json: {}, status: 200
    else
      render json: {}, status: 404
    end
  end

  def delete
    albumnes = Album.all.ids
    if albumnes.include?(params[:id])
      album_delete = Album.find(params[:id])
      album_delete.destroy
      render json: {}, status: 204
    else
      render json: {}, status: 404
    end
  end 

end
