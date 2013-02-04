#Simple Module of available StoryPoint Actions
module Actions
 
   TALK = "talk"
   FIGHT = "fight"
   GRAB = "get"
  
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