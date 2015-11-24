
class Planet
	attr_accessor :mass, :xpos, :ypos, :xvel, :yvel, :file, :win_x, :win_y, :universe_size, :width, :height, :velocity_x_current, :velocity_y_current

	def initialize(xpos, ypos, xvel, yvel, mass, win_x, win_y, universe_size, file)
		@xpos = xpos.to_f
		@ypos = ypos.to_f
		@xvel = xvel.to_f
		@yvel = yvel.to_f
		@mass = mass.to_f
		@win_y = win_y
		@win_x = win_x
		@universe_size = universe_size
		@file = file
		@velocity_init_x = 0
		@velocity_init_y = 0
		@acceleration_x = 0
		@acceleration_y = 0
		@x = win_x
		@y = win_y
		@image = Gosu::Image.new("images/#{file}")
	end
	G = "6.67408e-11".to_f

def draw
	@image.draw(@x, @y, 1)
end

def forces(planet)
	distance = Math.sqrt(((self.xpos - planet.xpos)**2) + ((self.ypos - planet.ypos)**2))
	force_total = (G*self.mass*planet.mass)/(distance**2)
	@xforce = force_total * ((self.xpos - planet.xpos) / distance)
	@yforce = force_total * ((self.ypos - planet.ypos) / distance)
	
end

def acceleration
	@acceleration_x = @xforce/@mass
	@acceleration_y = @yforce/@mass
end

def velocity
	print self.yvel
	@velocity_x_current = ((self.xvel + @acceleration_x) * 1000000000)
	@velocity_y_current = ((self.yvel + @acceleration_y) * 10000000)
	puts self.file
	
end

def position_update
	@x += @velocity_x_current / (@universe_size / 2)
	@y += @velocity_y_current / (@universe_size / 2)
	puts "xForce =  #{@xforce}"
	puts "yForce = #{@yforce}"
	puts "xVel = #{@velocity_x_current}"
	puts "yVel = #{@velocity_y_current}"
	puts "xPos = #{@x}"
	puts "yPos = #{@y}"
	puts
	# @x =((@xcurrent + @velocity_x_current) / 10000) + @win_x
	# @y = ((@ycurrent + @velocity_y_current) / 10000) + @win_y
	# @xcurrent = @xposC
	# @ycurrent = @yposC
	# puts self.file
	# puts @xcurrent
	# puts @ycurrent
end



# def acceleration(Force)
# 	accelerationX = Force/
# end


end
