module Directions
  
   EAST = "e" 
   WEST = "w" 
   NORTH = "n" 
   SOUTH = "s"
   
     attr_accessor :directions
     
     def returnDirections()
          value = ""
          
          @directions.each {
            | str |
            value << (str + ", ")
          }
          
       return value
     end
       
   
end