class TestSuperclass
  def run
    # calls all methods ending on _test
    symbols = self.methods
    strings = symbols.map(&:to_s)
    all_testmethods = strings.select { |m| m.include? "_test"}
    all_testmethods.each do |test_method|
      self.send(test_method) #send grabs a string and runs it as a method
    end
  end

  # raises an exception if expected is not actual
  # returns otherwise
  def assert(expected, actual, msg = "")
    if expected.eql? actual
      puts "victory"
    else
      puts "failure"
    end
  end

  # collect all inherited classes to run them later
  # inherited finds out classes that inherit from superclass
  def self.inherited(subclass)
    @tests ||= []
    @tests.push(subclass)
    puts @tests.to_s
    puts "New subclass: #{subclass}"
  end

  # run all the tests of all the classes that inherit from superclass
  def self.run_all_tests
    puts @tests.to_s
    @tests.each do |test_class|
      t = test_class.new
      t.run
    end
  end
end

require_relative 'monster_test'
TestSuperclass.run_all_tests
