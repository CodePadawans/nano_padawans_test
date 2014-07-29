class TestSuperclass
  def run
    # calls all methods ending on _test
    symbols = self.methods
    strings = symbols.map(&:to_s)
    all_testmethods = strings.select { |m| m.include? "_test"}
    all_testmethods.each do |methods|
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

  def self.inherited(subclass)
    @tests ||= []
    @tests.push(subclass)
    puts @tests.to_s
    puts "New subclass: #{subclass}"
    # collect all inherited classes to run them later
  end

  def self.run_all_tests
   # run all of them
     puts @tests.to_s
    @tests.each do |test_class|
    t = test_class.new
    t.run
    end
  end
end

require_relative 'monster_test'
TestSuperclass.run_all_tests
