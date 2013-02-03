#This is the Starting Script For the StoryEngine
#require_realtive ("Actions.rb")
require_relative "Actions.rb"
require_relative "Directions.rb"


class StoryPoint
  include Actions, Directions
  
  attr_reader :description
  
  def initialize (pDiscription, pLocation)
  @description = pText
  @location = pLocation
  end
  
  def tellDirections()
    return "You can go the following directions: #{returnDirections()}"
  end
  
  def tellActions()
    return "You can go the following actions #{returnActions()}"
  end
  
  def tellStoryNode()
    
  end
end

class StoryEngine
    @@numberOfStoryPoints = 0
end

myStory = StoryPoint.new("You enter a villiage")
myStory.directions = [Directions::EAST,Directions::SOUTH,Directions::NORTH,Directions::WEST];
myStory.actions= [Actions::FIGHT,Actions::TALK];

puts("The Story so far is #{myStory.description}")
puts("The Story so far is #{myStory.tellStory}")

