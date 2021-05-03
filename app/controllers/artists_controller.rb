
class ArtistsController < ApplicationController
  protect_from_forgery with: :null_session

  def create_artist
    puts("-----------\n")
    puts(params[:name])
    puts("-----------\n")
    if params[:name] == "" || params[:age] == ""
      puts("error\n")
      return render json: [], status: 400
    else
      puts("2222\n")
      name_artist = params[:name].strip
      age_artist = params[:age].to_i
      id_artist= Base64.encode64(name_artist).strip
      artistas = Artist.all.ids
      puts (artistas)
      if artistas.include?(id_artist)
        render json: Artist.find(id_artist), status: 409
      else
        artist = Artist.new
        artist.name = name_artist
        artist.id = id_artist
        artist.age = age_artist
        artist.self_artst = "artists/" + id_artist
        artist.tracks_artist = "artists/" + id_artist + "/tracks"
        artist.albums_artist = "artists/" + id_artist + "/albums"
        if artist.save
          render json: artist, status: 201
        end
      end
    end
  end

  def index
    artists = Artist.all
    codigo = Base64.encode64('La Santa')
    puts(codigo)
    #QmFkIEJ1bm55
    # album WUhMUU1ETEc=
    render json: artists, status: 200
  end

  def show
    artista = Artist.find(params[:id])
    if artista
      render json: artista, status: 200
    else
      render status: 404
    end
  end

  def play
    artistas = Artist.all.ids
    if artistas.include?(params[:id])
      albums = Artist.find(params[:id]).albums
      for album in albums
        for track in album.songs
          track.times_played += 1
          track.save
        end
      end
      render json: {}, status: 200
    else
      render json: {}, status: 404
    end

  end 

  def delete
    artistas = Artist.all.ids
    if artistas.include?(params[:id])
      artist_delete = Artist.find(params[:id])
      artist_delete.destroy
      render json: {}, status: 204
    else
      render json: {}, status: 404
    end
  end
end
