require_relative 'monster'

class MonsterTest < Test
  def eat_test
    @elza = Monster.new("Elza")
    eaten = @elza.eat("meat")
    puts eaten.inspect
    expected = "Elza ate meat"
    assert(expected, eaten)
  end
end
