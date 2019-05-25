require "sinatra"
require "erb"
enable :sessions
load "Names.rb"
load "NameValidator.rb"

names = Names.new("names.txt")

get "/monstas" do
  @message = session.delete(:message)
  @name = params["name"]
  @names = names.read_names
  erb :monstas
end

post "/monstas" do
  @name = params["name"]
  @names = names.read_names
  validator = NameValidator.new(@name, @names)

  if validator.valid?
    names.store_name(@name)
    session[:message] = "Successfully stored the name #{@name}."
    redirect "/monstas?name=#{@name}"
  else
    @message = validator.message
    erb :monstas
  end
end
