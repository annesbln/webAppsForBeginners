require 'sinatra'

get '/' do
    "Hello!"
end

get '/hello' do
    "I just said Hello!"
end

post '/signin' do
    "Signing in!"
end
