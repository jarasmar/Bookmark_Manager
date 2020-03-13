require 'sinatra/base'
require './lib/bookmark'

# Top level class
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    title = params['title']
    url = params['url']
    Bookmark.create(title: title, url: url)
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
