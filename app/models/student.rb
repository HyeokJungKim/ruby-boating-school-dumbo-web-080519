class Student
  attr_reader :first_name
  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_student(first_name)
    Student.all.find do |student|
      student.first_name == first_name
    end
  end

  def add_boating_test(test_name, status, instructor)
    # self is the student who called the method
    BoatingTest.new(test_name, status, self, instructor)
  end

  def tests
    BoatingTest.all.select do |test|
      test.student == self
    end
  end

  def grade_percentage
    passed_tests = tests.select do |test|
      test.status == "Passed"
    end
    passed_tests.count * 100.0 / tests.count
  end

  def instructors
    self.tests.map do |test|
      test.instructor
    end
  end





end
