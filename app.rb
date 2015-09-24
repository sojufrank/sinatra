require 'rubygems'
require "sinatra/base"

IMAGES = [
	{ title: "bird"		, url: "http://seattlekkf.com/image/bird.jpg" },
	{ title: "red panda"          , url: "https://tigr.net/wp-content/uploads/2014/09/red-panda-wondering.jpg" },
	{ title: "dog"          , url: "http://www.shibainuadvice.com/wp-content/uploads/2014/07/shiba_puppy.jpg" },
]

class App < Sinatra::Base
	get "/images" do
		@images = IMAGES
		erb:images
	end

	get "/images/:index" do |index|
		index = index.to_i
		@image = IMAGES[index]

		haml :"images/show", layout: true
	end

	get "/" do
		"Hello World via GET"
	end
	
	post "/" do
		"Hello World via POST"
	end
	
	put "/" do
		"Hello World via PUT"
	end
	
	delete "/" do
		"Goodbye World via DELETE"
	end
	
	get "/hello/:first_name/?:last_name?" do |first, last|
		"Hello #{first} #{last}"
	end
end
