#This is the Starting Script For the StoryEngine

require_relative "Actions.rb"
require_relative "Directions.rb"

module Node
  class StoryPoint
    include Actions, Directions
    
    attr_reader :description
    attr_reader :reference
    attr_accessor :logicGrid
    
      def initialize (discription, reference)
          @description = discription
          @reference = reference
          @logicGrid = Hash.new()
          @actions = [Actions::HELP]
      end
      
      
      def tellDirections()
          return "You can go the following directions: #{returnDirections()}"
      end
      
      def tellActions()
          return "You can do the following actions #{returnActions()} and #{Actions::HELP}"
      end
    
    def tellStoryNode()
        totalStory = "#{@description } \n"
        totalStory += "#{tellDirections()} \n "
        totalStory += "#{tellActions()}"
        puts(totalStory)
    end
  end 
end

