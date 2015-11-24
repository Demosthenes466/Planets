require_relative "planet"
require 'gosu'

class Gamewindow < Gosu::Window
	attr_accessor :window_size
	def initialize
		@window_size = 1000
		super @window_size, @window_size
		@planets = Array.new
		@background_image = Gosu::Image.new("space.jpg", :tileable => true)
		@universe_size = 0
		@line = 0
		@win_x = 0
		@win_y = 0
	end

	def setup_planets
		file = File.open("Planets.txt", "r")
		file.each_line do |line|
			array = line.chop.split(" ")
			if @line == 1
				@universe_size = array[0].to_f*2
			elsif @line >= 2
			  @planets.push(Planet.new(array[0].to_f, array[1].to_f, array[2].to_f, array[3].to_f, array[4], @universe_size, array[5], self))
			end
			@line += 1
		end
	end

	def update
		for i in 0...(@planets.length) do
			for k in 0...(@planets.length) do 	
				if i != k 
					@planets[i].forces(@planets[k])
				end
			end
		@planets[i].acceleration
		@planets[i].velocity
		@planets[i].position_update
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
