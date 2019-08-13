class BoatingTest
  attr_reader :name, :student, :instructor
  attr_accessor :status
  @@all = []

  def initialize(name, status, student, instructor)
    @instructor = instructor
    @student = student
    @name = name
    @status = status
    @@all << self
  end

  def self.all
    @@all
  end

end
