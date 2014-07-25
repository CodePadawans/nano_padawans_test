nano_padawans_test
==================

Our second project by RGSoC is to develop a tool for documentation testing. Therefore, we want to learn first about testing and the already existing tools.
A challenge for us here is to write a mini test framework, to understand what happens behind the scenes of an actual TF.

#### Elza - a monster that eats meat
We created a `class Monster` and a method `eat`. Therefore a `MonsterTest class` has a method `eat_test`.
There is also a `superclass Test`, that `MonsterTest` inherits from. 

#### class `Test` methods
`run` calls all methods ending on _test

`assert` takes 3 arguments `(expected, actual, msg = "")`

raises an exception if expected is not actual

returns otherwise

`self.inherited(subclass)` collects all inherited classes

`def self.run_all_tests` runs all of test of all inherited classes


At the end, you need to call `Test.run_all_tests` and **BOOM!!** all the test for all the classes run at a very high speed.
Elza ate meat. 
