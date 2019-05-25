require "sinatra"
enable :sessions
load "NameValidator.rb"

filename = "names.txt"

get "/hello" do
  if File.exists?(filename)
    @count = session[:count] || 0
  else
    @count = 0
  end
  @message = session.delete(:message)
  @name = params[:name]
  @names = read_names(filename)
  erb :header
end

get "/hello/" do
  redirect "/hello"
end

get "/hello/:name" do
  @name = params[:name]
  erb :welcome
end

post "/hello" do
  @name = params[:name]
  @names = read_names(filename)
  validator = NameValidator.new(@name, @names)

  if validator.valid?
    store_name(filename, @name)
    session[:message] = "Sucessfully stored the name #{@name}."
    session[:count] ||= 0
    session[:count] += 1
    redirect "/hello"
  else
    @message = validator.message
    session[:count] ||= 0
    @count = session[:count]
    erb :header
  end
end

delete "/hello" do
  message = delete_names(filename)
  session[:message] = message
  session[:count] = 0
  redirect "/hello"
end

def store_name(filename, string)
  File.open(filename, "a+") { |file| file.puts(string) }
end

def read_names(filename)
  return [] unless File.exists?(filename)
  File.read(filename).split("\n")
end

def delete_names(filename)
  return "There are no names in the list." unless File.exists?(filename)
  File.delete(filename)
  return "Successfully deleted the list of names."
end
