class Turn
	def initialize(story_point)
    @story_point = story_point		
	end
	
	def take_turn(next_point)
	  self.class.new(next_point)
	end
end

while game.running?
  node = StoryPoint.new(StoryPointReference::TN1)
  turn = Turn.new(node)
  game.take_turn("q")
end
