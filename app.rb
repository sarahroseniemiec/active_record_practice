require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:practice.sqlite3"

get "/" do
  erb :home
end

# get "/users" do
#   @users = User.all
#   #User is the class name User is the model
#   erb :users
# end

get "/profile" do
  @addresses = Address.all
  erb :profile
end

get "/contact" do
  erb :contact
end

get "/allusers" do
  @users = User.all
  @posts = Post.all
  erb :allusers
end

get "/createuser" do
  # @new_user = User.create(fname: "Charlie", lname: "Brown")
  # @new_post = Post.create(title: "this is hard", content: "learning databases is super difficult MEEE HEEEE HEEEE", user_id: 1)
  erb :createuser
end

get "/user" do
  @lastuser = User.last
  @lastpost = Post.last
  erb :user
end

post "/create_new_user" do
  params.inspect
  @new_user = User.create(fname: params[:fname], lname: params[:lname])
  @new_user_id = User.find_by(fname: params[:fname])
  @new_post = Post.create(title: params[:title], content: params[:content], user_id: @new_user_id )
  redirect "/createuser"
end


post "/create_user_address" do
  params.inspect
  @user = User.find_by(fname: params[:fname], lname: params[:lname])
  @new_address = Address.create(line1: params[:line1], line2: params[:line2], city: params[:city], state: params[:state], zip: params[:zip])
  redirect "/contact"
end

# get "/users:id" do
#   "the user id is #{params[:id]}"
#   @user = User.find(params[:id])
#   erb :user
# end
