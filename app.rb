require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do 
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do 
    erb :"peeps/new"
  end

  post '/peeps' do 
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
