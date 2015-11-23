require_relative "planet"
require 'gosu'

class Gamewindow < Gosu::Window
	def initialize
		@width = 1000
		@height = 1000
		super @width, @height
		@planets = Array.new
		@background_image = Gosu::Image.new("space.jpg", :tileable => true)
		@universe_size = 0
		@line = 0
	end

	def setup_planets
		puts "running"
		file = File.open("Planets.txt", "r")
		file.each_line do |line|
			array = line.chop.split(" ")
			if @line == 1
				@universe_size = array[0].to_f*2
			elsif @line >= 2
				array[0] = array[0].to_f/@universe_size*@width + @width/2
				array[1] = array[1].to_f/@universe_size*@height + @height/2
			  @planets.push(Planet.new(array[0].to_f, array[1].to_f, array[2].to_f, array[3].to_f, array[4], array[5]))
			end
			@line += 1
		end
		# @planets.delete_at(0)
		# @planets.delete_at(0)
		print @planets
	end

	def update
		for i in 0...(@planets.length-1) do
			for k in 0...(@planets.length-1) do 	
				if i != k 
					@planets[i].forces(@planets[k])
				end
			end
		end
	end

	def draw
		@background_image.draw(0,0,0)
		@planets.each{|planet| planet.draw}
	end

end

window = Gamewindow.new
window.setup_planets
window.show
