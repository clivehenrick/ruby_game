#This is the Starting Script For the StoryEngine

require_relative "Actions.rb"
require_relative "Directions.rb"

class StoryPoint
  include Actions, Directions
  
  attr_reader :description
  attr_reader :reference
  attr_reader :logicGrid
  
    def initialize (discription, reference)
        @description = discription
        @reference = reference
        @logicGrid = Hash.new()
    end
  
  #Will Merge Locations with Next Location Grid
    def setLocationGrid(logicGrid)
        @logicGrid = logicGrid 
    end
    
    def tellDirections()
        return "You can go the following directions: #{returnDirections()}"
    end
    
    def tellActions()
        return "You can do the following actions #{returnActions()}"
    end
  
  def tellStoryNode()
      totalStory = "#{@description } \n"
      totalStory += "#{tellDirections()} \n "
      totalStory += "#{tellActions()}"
      puts(totalStory)
  end
end
