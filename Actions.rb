#Simple Module of available StoryPoint Actions
module Actions
 
   TALK = "talk"
   FIGHT = "fight"
   GRAB = "get"
  
   attr_accessor :actions
   
   def returnActions()
       value = ""
          
          for str in @actions
            val << (str + ", ")
          end
       
       return value
   end
end