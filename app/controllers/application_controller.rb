class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  # get '/' do
  #   erb :index
  # end

  get '/songs' do
    @objects = Song.all
    erb :list
  end

  get '/songs/new' do
    erb :'song/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    erb :'song/show'
  end

  get '/artists' do
    @objects = Artist.all
    erb :list
  end

  get '/genres' do
    @objects = Genre.all
    erb :list
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params["slug"])
    erb :'artist/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params["slug"])
    erb :'genre/show'
  end

end
