require 'sinatra/base'
require './lib/bookmark'

# Top level class
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    url = params['url']
    Bookmark.create(url)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
