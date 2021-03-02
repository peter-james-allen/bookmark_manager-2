require 'sinatra/base'
require './lib/bookmarks.rb'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
