require "sinatra"
require "erb"
load "../names_app/Names.rb"

names = Names.new("members.txt")

get "/members" do
  @names = names.read_names
  erb :index
end

get "/members/:name" do
  @name = params[:name]
  erb :show
end
