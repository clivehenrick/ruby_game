require_relative "story_point.rb"
require_relative "story_point_reference.rb"
require_relative "story_data_save.rb"

module Engine
    class StoryEngine
      
      @@numberOfStoryPoints = 0
     
      attr_accessor :stories
      attr_reader :current_story_point
      
      # StoriesPoints are stored in a Hash Based on Reference
      def initialize ()
       @stories =  Hash.new()
       @game_saver = Engine::GameSaver.new()
      end
      
      def add_story (newStoryPoint)
         @stories[newStoryPoint.reference] =  newStoryPoint
         @@numberOfStoryPoints  += 1
      end
      
      def get_story_point (reference)
          if (@stories[reference] != nil)
            return @stories[reference]   
          else
              return @stories.default  
          end
      end
      
      def set_story_point_engine(reference)
          @current_story_point = get_story_point(reference)
          start_sequence()
      end
      
      def start_sequence()
          @current_story_point.tellStoryNode()
          nextReference = check_user_action()
          puts("UserNext Action is #{nextReference}")
          set_story_point_engine(nextReference)
      end
      
      def check_user_action()
         begin
             playerAction = gets.chomp().to_s
             puts("TESTING --> #{playerAction}")
             if (@current_story_point.logicGrid[playerAction])
                    realAction =  @current_story_point.logicGrid[playerAction]
             elsif (playerAction == Actions::HELP)
                  puts("Current Actions are: #{@current_story_point.tellActions()}")  
             elsif (playerAction == Actions::CREATE)
                 allow_users_enter_story_point()  
             else
                  puts("Please Enter an allowed action or direction: ?")  
              end
         end until  realAction
        
        return realAction
      end
      
      def allow_users_enter_story_point()
        print("Enter discription \n")
        discription = gets.chomp().to_s
        puts("Enter Reference \n")
        reference = gets.chomp().to_s
        
        begin
          puts "Enter a list of Directions [e,w,n,s]: \n"
          directions_list = gets.chomp.split(",").uniq
        end until directions_list.all? { |member| Directions::DIRECTIONS.include?(member) }
        
        puts directions_list.inspect
        
        pairs = {}
        begin
          puts("Enter direction then reference. EX: e,town Type EXIT to finish")
          direction, place = gets.chomp.split(",")
          break if direction == 'EXIT'
          pairs[direction] = place
          p(pairs)
        end until direction == 'EXIT'
        puts('Final Commands: #{pairs} ')
        
        story_point = Engine::StoryPoint.new(discription,reference)
        story_point.directions= directions_list
        story_point.logicGrid= pairs
        add_story(story_point)
        
        set_story_point_engine(story_point.reference)
      end
      
      #Convert the StoryPointsHash to YAML Ready Format
      def dump (story_point)
        @game_saver.save(story_point.dump())
          
      end
      def dump_all_stories()
          
      end
      def get_stories_saved ()
        
      end
  end
  
end
