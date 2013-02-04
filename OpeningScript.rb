#This is the Main Engine for the StoryPoints
require_relative "StoryPoint.rb"
require_relative "StoryPointReference.rb"

class StoryEngine
    include StoryPointReference
    
    @@numberOfStoryPoints = 0
   
    attr_accessor :stories
    attr_reader :curStoryPoint
    
    # StoriesPoints are stored in a Hash Based on Reference
    def initialize ()
     @stories =  Hash.new()
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
    
    def setStoryPointEngine(reference)
        @curStoryPoint = getStoryPoint(reference)
        startSequence()
    end
    
    def startSequence()
        @curStoryPoint.tellStoryNode()
        nextReference = checkUserAction()
        puts ("UserNext Action is #{nextReference}")
        setStoryPointEngine(nextReference)
    end
    
    def checkUserAction()
       begin
           playerAction = gets.chomp().to_s
           puts("TESTING --> #{playerAction}")
           if (@curStoryPoint.logicGrid[playerAction] != nil)
                  realAction =  @curStoryPoint.logicGrid[playerAction]
            elsif (playerAction == Actions::HELP)
                puts ("Current Actions are: #{@curStoryPoint.tellActions()}")  
            else
                puts("Please Enter an allowed action or direction: ?")  
            end
       end until  realAction != nil
      
      return realAction
    end
    
    
    
end


myStoryEngine = StoryEngine.new();

#GET THE ENGINE READY
myStory = StoryPoint.new("Out of the Rising Fog you find your self in Harmersmith", StoryPointReference::TN1)
myStory.directions = [Directions::EAST,Directions::SOUTH,Directions::NORTH,Directions::WEST];
myStory.logicGrid = {Directions::EAST=>StoryPointReference::TN2,Directions::NORTH=>StoryPointReference::TN3,Directions::WEST=>StoryPointReference::TN4}
myStoryEngine.addStory(myStory)

myStory2 = StoryPoint.new("You Stand in front of an old rundown church to some forgoten Eldar God", StoryPointReference::TN2)
myStory2.directions = [Directions::WEST];
myStory2.logicGrid = {Directions::WEST=>StoryPointReference::TN1}
myStoryEngine.addStory(myStory2)

myStoryEngine.setStoryPointEngine(StoryPointReference::TN1)


