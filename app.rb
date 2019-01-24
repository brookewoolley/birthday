require 'sinatra/base'

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/birthday' do
    session[:name] = params[:name]
    session[:birth_date] = params[:birth_date].to_i
    session[:birth_month] = params[:birth_month].to_i
    redirect "/birthday_message"
  end

  get '/birthday_message' do
    @name = session[:name]
    @birth_date = session[:birth_date]
    @birth_month = session[:birth_month]
    @today_date = Time.now.day
    @today_month = Time.now.month
    erb :birthday_message
  end

  run! if app_file == $0
end
