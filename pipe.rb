require_relative "drawable_entity"

class Pipe < DrawableEntity
	def initialize(window, top, offset)
		@gap_size = 80
		if top
			super(window, 1024, (-500 - @gap_size) + offset, 0.0, Gosu::Image.new(window, "resources/images/pipe.jpg", false))
		else
			super(window, 1024, (500 - @gap_size) + offset, 0.0, Gosu::Image.new(window, "resources/images/pipe.jpg", false))	
		end
		@velocity = -7
	end

	def update
		@x += @velocity
		if @x - @width
			kill
		end
	end

	def collide_x?(entity)
		return entity.x > @x && entity.x < @x + @width
	end

	def collide_y?(entity)
		return entity.y > @y && entity.y < @y + @height
	end
end