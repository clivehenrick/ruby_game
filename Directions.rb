module Directions
  
   EAST = "e" 
   WEST = "w" 
   NORTH = "n" 
   SOUTH = "s"
   
     attr_accessor :directions
     
     def returnDirections()
          value = ""
          
          for str in @directions
            val << (str + ", ")
          end
       
       return value
     end
       
   
end