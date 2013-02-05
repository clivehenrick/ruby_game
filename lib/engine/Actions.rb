#Simple Module of available StoryPoint Actions
module Actions
 
   TALK = "talk"
   FIGHT = "fight"
   GRAB = "get"
   RESTART = "RestartTheGame"
   HELP = "help"
   
   attr_accessor :actions
   
   def returnActions()
       value = ""
          
          @actions.each {
            | str |
            value << (str + ", ")
          }
          
       return value
   end
end