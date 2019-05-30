require "sinatra"
require "erb"
enable :sessions
load "Names.rb"
load "NameValidator.rb"

names = Names.new("members.txt")

get "/members" do
  @names = names.read_names
  erb :index
end

get "/members/new" do
  erb :new
end

get "/members/:name" do
  @message = session.delete(:message)
  @name = params[:name]
  erb :show
end

post "/members" do
  @name = params[:name]
  @names = names.read_names

  validator = NameValidator.new(@name, @names)
  if validator.valid?
    names.store_name(@name)
    session[:message] = "Successfully stored the name #{@name}."
    redirect "/members/#{@name}"
  else
    @message = validator.message
    erb :new
  end
end

