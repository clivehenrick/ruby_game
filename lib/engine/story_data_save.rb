require_relative "story_point.rb"

module handleData
  class StoryDataHandler
   
    require "yaml"
    
    def initialize() 
      @story_array = Array.new()
      @filename = "storyPlots.yaml"
    end
    
    
    #Load and Create a Hash
    def createStoryPoint (discription, reference, cmdHash)
      
      
      
    end
    
    #Add Story to the YAML
    def recordStoryPoint
   
   
    end

    def saveDB
      File.open ($fn, 'w') {
        |f|
        f.write($storyPlots.to_yaml)
      }  
    end
    
    def loadDB
      input_data = File.read ()
    end


  end
end