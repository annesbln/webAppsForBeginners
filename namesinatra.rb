require 'sinatra'

get '/members/:name' do
    "Hello #{params[:name]}!"
end