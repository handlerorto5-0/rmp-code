class Greeting
  def initialize (text)
    @text = text
  end

  def welcome
    @text
  end
end

p my_object=Greeting.new('Hello')
p my_object.class
p my_object.class.instance_methods(false)
p my_object.instance_variables
