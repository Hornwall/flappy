require_relative "entity"
require_relative "pipe_pair"

class MapControler < Entity
	attr_reader :pipes
	def initialize(window)
		super(window)
		@last_spawn = Time.now
		@interval = 1
		@pipes = []
	end

	def update
		if Time.now - @last_spawn > @interval
			spawn
		end
		@pipes.each(&:update)
	end

	def spawn
		@last_spawn = Time.now
		prng = Random.new()
		@pipes << PipePair.new(@window, prng.rand(-300..300))
	end

	def draw
		@pipes.each(&:draw)
	end

end