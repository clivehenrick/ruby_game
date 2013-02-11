#This is the Starting Script For the StoryEngine

require_relative "Actions.rb"
require_relative "Directions.rb"

module Engine
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
          return "You can do the following actions #{returnActions()}
           plus #{Actions::HELP} , #{Actions::CREATE}"
      end
    
    def tellStoryNode()
        totalStory = "#{@description } \n"
        totalStory += "#{tellDirections()} \n "
        totalStory += "#{tellActions()}"
        puts(totalStory)
    end
    
    def dump
      array = [@description,@reference,@logicGrid,@actions,@directions].to_yaml
      return array
    end
  end 
end

