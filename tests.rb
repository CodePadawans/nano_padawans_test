require_relative 'test1.rb'

class Test
  def run
    # calls all methods ending on _test
    symbols = self.methods 
    strings = symbols.map { |s| s.to_s }
    blah = strings.select { |m| m.include? "_test"}
    blah.each do |methods| 
      self.send(methods) 
    end
  end

  def assert(expected, actual, msg = "")
    # raises an exception if expected is not actual
    # returns otherwise
    if expected.eql? actual
      puts "victory"
    else
      puts "failure"
    end
  end

  def self.inherited(klass)
    @tests ||= []
    # collect all inherited classes to run them later
  end

  def self.run_all_tests
    # run all of them
    @test.run
  end
end

class MonsterTest < Test
  def eat_test
    @elza = Monster.new("Elza")
    eaten = @elza.eat("meat")
    puts eaten.inspect
    expected = "Elza ate meat"
    assert(expected, eaten)
  end
end

m = MonsterTest.new
p m.run
t = Test.new
p t.inherited(MonsterTest)
