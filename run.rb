require_relative "planet"
require 'gosu'

class Gamewindow < Gosu::Window
	def initialize
		super 1024, 1024
		self.caption = "Planet Simulation"
		@planets = Array.new
		@background_image = Gosu::Image.new("space.jpg", :tileable => true)
	end

	def setup_planets
		puts "running"
		file = File.open("Planets.txt", "r")
		file.each_line do |line|
			array = line.chop.split(" ")
			@planets.push(Planet.new(array[0].to_f, array[1].to_f, array[2].to_f, array[3].to_f, array[4], array[5]))
		end
		@planets.delete_at(0)
		@planets.delete_at(0)
		print @planets
	end

	def update
		for i in 0...(@planets.length-1) do
			for k in 0...(@planets.length-1) do 	
				if i != k 
					@planets[i].forces(@planets[k])
					print @planets[i].file
					print @planets[k].file
					puts
				end
			end
		end
	end

	def draw
		@background_image.draw(0,0,0)
	end

end

window = Gamewindow.new
window.setup_planets
window.show
