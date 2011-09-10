class Grade
  include Comparable
  
  attr_accessor :value, :letter, :signal
  
  def initialize value
    raise 'Invalid Grade' unless value.length < 3 && value =~ /^([a-fA-F]{1}[\+-]?)$/
    self.value = value
    self.letter = value[0,1]
    # '+' => 1, '' => 0, '-' => -1
    self.signal = value[1,1].nil? ? 0 : (value[1,1] == '+' ? 1 : -1)
  end
  
  def <=> another_grade
    return self.signal <=> another_grade.signal if self.letter == another_grade.letter
    (self.letter <=> another_grade.letter) * -1
  end
  
  def to_s
    "Grade: #{self.value}"
  end
end