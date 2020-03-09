require 'sinatra/base'

class Bookmark_Manager < Sinatra::Base

  get '/' do
    'Hello'
  end

run! if app_file == $0
end
