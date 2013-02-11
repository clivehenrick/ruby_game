#Game State is the State of the Game During Playback

class GameState
  
  LOADING = "loading"
  PLAYING = "playing"
  
  attr_reader :current_state
  
  def initialized ()
    @current_state = LOADING
  end
  
  def changeState (new_state)
    case (new_state)
     when PLAYING then
       
     when LOADING then
       
 
    end
  end
end