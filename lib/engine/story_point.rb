#This is the Starting Script For the StoryEngine

require_relative "Actions.rb"
require_relative "Directions.rb"

module Engine
  class StoryPoint
    include Actions, Directions
    
    attr_reader :description
    attr_reader :reference
    attr_accessor :logic_grid
    
      def initialize (discription, reference)
          @description = discription
          @reference = reference
          @logic_grid = Hash.new()
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
      array = [@description,@reference,@logic_grid,@actions,@directions].to_yaml
      return array
    end
    
    def load (array)
      newStory = this.new(array[0], array[1])
      newStory.logic_grid= array[2]
      newStory.actions = array[3]
      newStory.directions = array[4]
      return newStory
    end
  end 
end

