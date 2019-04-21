require "sinatra"

filename = "names.txt"
if File.exists?(filename)
  File.delete("names.txt")
end

get "/hello" do
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
  store_name(filename, @name)
  redirect "/hello/#{@name}"
end

def store_name(filename, string)
  File.open(filename, "a+") { |file| file.puts(string) }
end

def read_names(filename)
  return [] unless File.exists?(filename)
  File.read(filename).split("\n")
end
