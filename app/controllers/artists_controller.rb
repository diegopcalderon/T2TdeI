
class ArtistsController < ApplicationController
  protect_from_forgery with: :null_session

  def create_artist
    
    
    if params[:name].blank? || params[:age].blank?
     
      return render json: [], status: 400
    else
      
      name_artist = params[:name].strip
      age_artist = params[:age].to_i
      id_artist= Base64.encode64(name_artist).strip[0..21]
      artistas = Artist.all.ids
     
      if artistas.include?(id_artist)
        render json: Artist.find(id_artist), status: 409
      else
        artist = Artist.new
        artist.name = name_artist
        artist.id = id_artist
        artist.age = age_artist
        artist.self_artst = "https://dbcaldet2.herokuapp.com/artists/" + id_artist
        artist.tracks_artist = "https://dbcaldet2.herokuapp.com/artists/" + id_artist + "/tracks"
        artist.albums_artist = "https://dbcaldet2.herokuapp.com/artists/" + id_artist + "/albums"
        if artist.save
         return render json: artist, status: 201
        end
      end
    end
  end

  def index
    artists = Artist.all
    codigo = Base64.encode64('La Santa')
  
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
