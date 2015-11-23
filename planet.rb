
class Planet
	attr_accessor :mass, :xpos, :ypos, :xvel, :yvel, :file, :win_x, :win_y, :universe_size

	def initialize(xpos, ypos, xvel, yvel, mass, win_x, win_y, universe_size, file)
		@xpos = xpos.to_f
		@ypos = ypos.to_f
		@xvel = xvel.to_f
		@yvel = yvel.to_f
		@mass = mass.to_f
		@win_x = win_x
		@win_y = win_y
		@universe_size = universe_size
		@file = file
		@image = Gosu::Image.new("images/#{file}")
	end
	G = "6.67408e-11".to_f

def draw
	@image.draw(@win_x, @win_y, 1)
end

def forces(planet)
	force = (G*self.mass*planet.mass)/((self.xpos-planet.xpos)**2 + (self.ypos+planet.ypos)**2)
	force_x = force * (@win_x / @universe_size/2)
end


# def acceleration(Force)
# 	accelerationX = Force/
# end


end
