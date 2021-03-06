class UsersController < ApplicationController

   get '/signup' do
     if !session[:user_id]
       erb :'users/new'
     else
       redirect to '/tracks'
     end
   end

   post '/signup' do
     if params[:username] == "" || params[:password] == ""
       redirect to '/signup'
     else
       @user = User.create(:username => params[:username], :password => params[:password])
       session[:user_id] = @user.id
       redirect '/tracks'
     end
   end

   get '/login' do
     @error_message = params[:error]
     if !session[:user_id]
       erb :'users/login'
     else
       redirect '/tracks'
     end
   end

   post '/login' do
     user = User.find_by(:username => params[:username])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect "/tracks"
     else
       redirect to '/signup'
     end
   end

end
