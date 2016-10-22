require 'rubygems'
require 'prime'

class Question

  def run
    Question.instance_methods(false).reject{|m| m == :run}.each do |method|
      puts "Question #{method.to_s}: #{self.send(method)}"
    end
  end

  # If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
  # Find the sum of all the multiples of 3 or 5 below 1000.
  def one
    (1..999).to_a.inject([]){|array, n| array << n if ((n%5).zero? || (n%3).zero?); array }.inject(:+)
  end

  # Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
  # 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
  # By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  def two
    a=1; b=2; f=3; t=b; (a,b=b,f; f=(a+b); t+=b if b.even?) while(f<4000000)
    return t
  end

  # The prime factors of 13195 are 5, 7, 13 and 29.
  # What is the largest prime factor of the number 600851475143 ?
  def three
    600851475143.prime_division.last.first
  end

  # A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  # Find the largest palindrome made from the product of two 3-digit numbers.
  def four
    range = (100...1000).to_a.reverse.inject([0]) do |array, number|
      highest_palindromic = highest_palindromic_for(number)
      array << highest_palindromic if highest_palindromic and highest_palindromic > array.last
      array
    end.last
  end

  private def palindromic?(integer)
    integer.to_s.reverse.to_i == integer
  end

  private def highest_palindromic_for(integer, range: 999)
    counter = range
    loop do
      multiplied = integer * counter
      palindromic = palindromic?(multiplied)
      return multiplied if palindromic
      counter -= 1
      break if counter.zero? or palindromic
    end
  end
end

Question.new.run
