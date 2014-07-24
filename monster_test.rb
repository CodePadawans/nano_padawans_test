require_relative 'monster_class'

class MonsterTest < Test
  def eat_test
    @elza = Monster.new("Elza")
    eaten = @elza.eat("meat")
    puts eaten.inspect
    expected = "Elza ate meat"
    assert(expected, eaten)
  end

m = MonsterTest.new
p m.run
t = Test.new
end
