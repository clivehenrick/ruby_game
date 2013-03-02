#This is the Starting Script For the StoryEngine

require_relative "Actions.rb"
require_relative "Directions.rb"

module Engine
  class StoryPoint
    include Actions, Directions
    
    attr_accessor :description
    attr_accessor :reference
    attr_accessor :logic_grid
    
      def initialize (discription = "", reference = "")
          @description = discription
          @reference = reference
          @logic_grid = Hash.new()
          @actions = [Actions::HELP]
      end
      
      def intialize (hsh)
        puts("THis was called")
        super        
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
      hash = {:description => @description,:reference =>@reference,:logic_grid => @logic_grid,:actions => @actions,:description => @directions}.to_yaml
      return hash
    end
    
    #dump[:description]
    
    def load (loadedHash)
      
      @description = loadedHash[:description]
      @reference =  loadedHash[:reference]
      @logic_grid = loadedHash[:logic_grid]
      @actions = loadedHash[:actions]
      @directions = loadedHash[:description]
      return this
    end
  end 
end

