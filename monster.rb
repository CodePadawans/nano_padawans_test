class Monster

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def eat(food)
   "#{@name} ate #{food}"
  end
end
