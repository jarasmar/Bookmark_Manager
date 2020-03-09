# frozen_string_literal: true

require 'sinatra/base'

class Bookmark_Manager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $0
end
