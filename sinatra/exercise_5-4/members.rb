require "sinatra"
require "erb"
enable :sessions
use Rack::MethodOverride
load "Names.rb"
load "NameValidator.rb"

names = Names.new("members.txt")

get "/members" do
  @names = names.read_names
  erb :index
end

get "/members/:name" do
  @message = session.delete(:message)
  @name = params[:name]
  erb :show
end

get "/members/:name/edit" do
  @message = session.delete(:message)
  @name = params[:name]
  erb :edit
end

get "/members/:name/delete" do
  @name = params[:name]
  erb :delete
end

get "/members/new/member" do
  erb :new
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

put "/members/:name" do
  @new_name = params[:new_name]
  @name = params[:name]
  @names = names.read_names

  validator = NameValidator.new(@new_name, @names)
  if validator.valid?
    names.exchange(@name, @new_name)
    session[:message] = "Successfully edited the name #{@name} to #{@new_name}."
    redirect "/members/#{@new_name}"
  else
    @message = validator.message
    erb :edit
  end
end

delete "/members/:name" do
  @name = params[:name]
  names.delete(@name)
  redirect "/members"
end