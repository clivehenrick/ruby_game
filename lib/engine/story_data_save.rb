require_relative "story_point.rb"

module Engine
  class GameSaver
   
    require "yaml"

###### missing implementation
    
    def initialize(game_state) 
      @game_state = game_state
    end

    def save!
      contents = @game_state.dump
      YAML::dump(save_file, contents)
    end
    
    def load!
      raise Exception.new("no file to load!") unless File.exists?(save_file)
      state = YAML::load(save_file)
      GameState.new(state)
    end

    def save_file
      "/home/clive/file.yml"
    end

###### /missing implementation
    
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