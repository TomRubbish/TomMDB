require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'


get "/" do

    erb(:index)

end

get "/about" do

    erb(:about)

end

get "/movie" do

  movie_title = params["title"].downcase.gsub(" ", "+")

  url = "http://omdbapi.com/?apikey=6be7bd0c&t=#{movie_title}"
  movie = HTTParty.get(url)


  
  erb(:movie_details, locals: { movie: movie })



end