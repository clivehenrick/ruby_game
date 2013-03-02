require_relative "story_point.rb"
require_relative "story_engine.rb"

module Engine
  class GameSaver
   
    require "yaml"

    attr_reader :save_file
###### missing implementation
    
    def initialize() 
     
    end

    def save(story_point_yaml)
      #contents = @game_engine.dump
      puts(story_point_yaml)
      File.open(save_file_stories,'w') { |f| f.write(story_point_yaml) }
      #YAML::dump(save_file, story_point_yaml)
    end
    
    def save_all(all_stories_yml)
      
    end
    
     def load_game_state!
      raise Exception.new("no file to load!") unless File.exists?(save_file_game_state)
      state = YAML::load(save_file_game_state)
      GameState.new(state)
    end
    
    def load_stories!
      raise Exception.new("no file to load!") unless File.exists?(save_file_stories)
      stories = YAML::load_file(save_file_stories)
      return stories
    end

    def save_file_game_state
      return "/home/clive/file.yml"
    end
    
    def save_file_stories
      return "stories.yml"
    end

###### /missing implementation
    
    #Load and Create a Hash
    def createStoryPoint (discription, reference, cmdHash)
      
      
      
    end
    
    #Add Story to the YAML
    def recordStoryPoint
   
   
    end

    def saveDB
      # File.open ($fn, 'w') {
        # |f|
        # f.write($storyPlots.to_yaml)
      # }  
    end
    
    def loadDB
      # input_data = File.read ()
    end


  end
end