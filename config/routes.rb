Rails.application.routes.draw do
  
  post 'artists', to: 'artists#create_artist'
  post 'artists/:id/albums', to: 'albums#create_album'
  post 'albums/:id/tracks', to: 'songs#create_tracks'

  get 'artists', to: 'artists#index', as: 'artists_index'
  get 'artists/:id', to: 'artists#show'
  get 'artists/:id/albums', to: 'albums#show_albums'
  get 'artists/:id/tracks', to: 'songs#show_artist_tracks'
  get 'albums', to: 'albums#index'
  get 'albums/:id', to: 'albums#show'
  get 'albums/:id/tracks', to: 'songs#show_album_tracks'
  get 'tracks', to: 'songs#index'
  get 'tracks/:id', to: 'songs#show'

  put 'artists/:id/albums/play', to: 'artists#play'
  put 'albums/:id/tracks/play', to: 'albums#play'
  put 'tracks/:id/play', to: 'songs#play'

  delete 'artists/:id', to: 'artists#delete'
  delete 'albums/:id', to: 'albums#delete'
  delete 'tracks/:id', to: 'songs#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
