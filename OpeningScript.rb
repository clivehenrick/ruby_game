#This is the Main Engine for the StoryPoints
require_relative "StoryPoint.rb","StoryPointReference.rb"

class StoryEngine
    include StoryPoint, StoryPointReference
    
    @@numberOfStoryPoints = 0
   
    attr_accessor :stories
    attr_reader :curStoryPoint
    
    # StoriesPoints are stored in a Hash Based on Reference
    def initialize ()
     @stories =  Hash.new(new StoryPoint("Unstable Story: Please Restart", Actions::RESTART, "Restart0"))
    end
    
    def addStory (newStoryPoint)
       @stories[newStoryPoint.reference] =  newStoryPoint
       @@numberOfStoryPoints  += 1
    end
    
    def getStoryPoint (reference)
        if (@stories[reference] != nil)
          return @stories[reference]   
        else
            return @stories.default  
        end
    end
    
    def startStoryEngine
end


myStoryEngine = StoryEngine.new();

#GET THE ENGINE READY
myStory = StoryPoint.new("Out of the Rising Fog you find your self in Harmersmith", StoryPointReference::TN0)
myStory.directions = [Directions::EAST,Directions::SOUTH,Directions::NORTH,Directions::WEST];
myStory.setLocationGrid = {Directions::EAST=>StoryPointReference::TN2,Directions::NORTH=>StoryPointReference::TN1,Directions::WEST=>StoryPointReference::TN3}
myStoryEngine.addStory(myStory)

myStory2 = StoryPoint.new("You Stand in front of an old rundown church to some forgoten Eldar God", StoryPointReference::TN2)
myStory2.directions = [Directions::WEST];
myStory2.setLocationGrid = {Directions::WEST=>StoryPointReference::TN0}
myStoryEngine.addStory(myStory2)
# puts("#{myStory.tellStoryNode}")
# puts("#{myStory.reference}")



