require_relative "story_point.rb"
require_relative "story_point_reference.rb"

module Engine
    class StoryEngine
      
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
             if (@curStoryPoint.logicGrid[playerAction])
                    realAction =  @curStoryPoint.logicGrid[playerAction]
             elsif (playerAction == Actions::HELP)
                  puts ("Current Actions are: #{@curStoryPoint.tellActions()}")  
             else
                  puts("Please Enter an allowed action or direction: ?")  
              end
         end until  realAction
        
        return realAction
      end
  end
  
  class DaDa
    
  end
end
