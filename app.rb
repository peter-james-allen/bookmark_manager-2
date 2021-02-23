# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do

    p ENV

    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
