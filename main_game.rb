$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')


# This is the Main Game Script

#This is the Main Engine for the StoryPoints
#require_relative "engine/story_point.rb"
#require_relative "engine/story_point_reference.rb"
require_relative "lib/engine.rb"

#This is the Main Engine for the StoryPoints



myStoryEngine = Engine::StoryEngine.new();


#GET THE ENGINE READY
myStory = Node::StoryPoint.new("Out of the Rising Fog you find your self in Harmersmith", StoryPointReference::TN1)
myStory.directions = [Directions::EAST,Directions::SOUTH,Directions::NORTH,Directions::WEST];
myStory.logicGrid = {Directions::EAST=>StoryPointReference::TN2,Directions::NORTH=>StoryPointReference::TN3,Directions::WEST=>StoryPointReference::TN4}
myStoryEngine.addStory(myStory)

myStory2 = Node::StoryPoint.new("You Stand in front of an old rundown church to some forgoten Eldar God", StoryPointReference::TN2)
myStory2.directions = [Directions::WEST];
myStory2.logicGrid = {Directions::WEST=>StoryPointReference::TN1}
myStoryEngine.addStory(myStory2)

myStoryEngine.setStoryPointEngine(StoryPointReference::TN1)