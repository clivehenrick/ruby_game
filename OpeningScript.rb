#This is the Starting Script For the StoryEngine
#require_realtive ("Actions.rb")
require_relative "Actions.rb"
require_relative "Directions.rb"


class StoryPoint
  include Actions, Directions
  
  attr_reader :description
  
  def initialize (pDiscription, pLocation)
  @description = pDiscription
  @location = pLocation
  end
  
  def tellDirections()
    return "You can go the following directions: #{returnDirections()}"
  end
  
  def tellActions()
    return "You can do the following actions #{returnActions()}"
  end
  
  def tellStoryNode()
    totalStory = "#{@description } #{@location} \n"
    totalStory += "#{tellDirections()} \n "
     totalStory += "#{tellActions()}"
    puts(totalStory)
  end
end

class StoryEngine
    @@numberOfStoryPoints = 0
end

myStory = StoryPoint.new("The Fog rises and you find your self in ", "the ancient village of SummerSmith")
myStory.directions = [Directions::EAST,Directions::SOUTH,Directions::NORTH,Directions::WEST];
myStory.actions= [Actions::FIGHT,Actions::TALK];

puts("#{myStory.tellStoryNode}")



