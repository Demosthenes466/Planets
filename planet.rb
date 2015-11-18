
class Planet
	attr_accessor :mass, :xpos, :ypos, :xvel, :yvel, :file

	def initialize(xpos, ypos, xvel, yvel, mass, file)
		@xpos = xpos.to_f
		@ypos = ypos.to_f
		@xvel = xvel.to_f
		@yvel = yvel.to_f
		@mass = mass.to_f
		@file = file

	end
	G = "6.67408e-11".to_f

def forces(planet)

	force = (G*self.mass*planet.mass)/((self.xpos-planet.xpos)**2 + (self.ypos+planet.ypos)**2)
	print force.to_f
	puts
end

# def acceleration(Force)
# 	accelerationX = Force/
# end


end
