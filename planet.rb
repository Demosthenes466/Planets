
class Planet
	attr_accessor :mass, :xpos, :ypos, :xvel, :yvel, :file, :universe_size, :force, :window_size

	def initialize(xpos, ypos, xvel, yvel, mass, universe_size, file, system)
		@window_size = system.window_size
		@xpos = xpos.to_f
		@ypos = ypos.to_f
		@xvel = xvel.to_f
		@yvel = yvel.to_f
		@mass = mass.to_f
		@universe_size = universe_size
		@file = file
		@acceleration_x = 0
		@acceleration_y = 0
		@xforce = 0
		@yforce = 0
		@x = scale(xpos)
		@y = scale(ypos)
		@image = Gosu::Image.new("images/#{file}")
	end

	G = "6.67408e-11".to_f

	def draw
		@image.draw(@x, @y, 1)
	end

	def forces(planet)
		distance = Math.sqrt(((self.xpos - planet.xpos)**2) + ((self.ypos - planet.ypos)**2))
		@force = (G*self.mass*planet.mass)/(distance**2)
		@xforce -= (@force * ((@xpos - planet.xpos) / distance))
		@yforce -= (@force * ((@ypos - planet.ypos) / distance))
	end

	def acceleration
		@acceleration_x = @xforce/@mass
		@acceleration_y = @yforce/@mass
		@xforce = 0
		@yforce = 0
	end

	def velocity
		@xvel += @acceleration_x * 100000
		@yvel += @acceleration_y * 100000
	end

	def position_update
		@xpos += @xvel * 50000
		@ypos += @yvel * 50000
		@x = scale(@xpos)
		@y = scale(@ypos)
	end

private 

	def scale(pos)
		pos * @window_size / @universe_size + @window_size / 2
	end



end
