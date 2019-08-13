class Instructor
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def tests
    BoatingTest.all.select do |test|
      test.instructor == self
    end
  end

  def students
    tests.map do |test|
      test.student
    end
  end

  def pass_student(student, test_name)
    found_test = self.tests.find do |test|
      test.name == test_name && test.student == student
    end

    if found_test
      found_test.status = "Passed"
    else
      BoatingTest.new(test_name, "Passed", student, self)
    end
  end















end
