class Node
  include Comparable 
  attr_reader :value
  attr_accessor :left_child, :right_child 

  def initialize(value=nil)
    @value = value
    @left_child = nil
    @right_child = nil
  end 

  def <=>(other)
    if other.class == Node
      @value <=> other.value 
    else 
      @value <=> other
    end 
  end  
end