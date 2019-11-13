class Question
  attr_reader :num1, :num2, :result
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @result = num1 + num2
  end

  def ask
   "what is #{self.num1} + #{self.num2}?!"
  end
end