require './config/environment'

class ApplicationController < Sinatra::Base

   configure do
         set :views, "app/views"
   end

   get '/' do
         erb :home
   end

   helpers do
     def redirect_if_not_logged_in
      if !logged_in?
         redirect "/login?error=You have to be logged in to do that"
      end
     end

     def logged_in?
      !!session[:user_id]
     end

     def current_user
      User.find(session[:user_id])
     end

   end

end
