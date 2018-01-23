class TracksController < ApplicationController

   get "/tracks" do

     @tracks = Track.all
     erb :'tracks/index'
   end



end
