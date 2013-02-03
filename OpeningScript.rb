#This is the Starting Script For the StoryEngine
#require_realtive ("Actions.rb")
require_relative "Actions.rb"
include Actions

class StoryPoint
  include Actions
  
  attr_reader :description
  
  def initialize (pText)
  @description = pText
  end
end


myStory = StoryPoint.new("You enter a villiage")
myStory.actions = ["e","w","n","s"];
puts("The Story so far is #{myStory.description}")

