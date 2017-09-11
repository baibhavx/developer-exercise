class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  
  def self.starts_with_capital?(word) 
    word[0] === word[0].upcase
  end
  
  def self.is_alphabet?(character)
    ('a'..'z').to_a.include?(character.downcase)
  end
  
  def self.marklar(str)
    raise 'Input must be a string' if !str.is_a? String

    str.split(' ').map do |word|
      if word.length > 4
        replaceStr = starts_with_capital?(word) ? 'Marklar' : 'marklar'
        # Assumes character is a symbol if its not an alphabet
        is_alphabet?(word[-1]) ? replaceStr : replaceStr + word[-1]
      else
        word
      end  
    end.join(' ')

  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10

  def self.get_n_fibonaccis(n)
    raise 'Input must be a number' if !n.is_a? Numeric
    raise 'Input must be a positive number' if n < 0
    return [] if n == 0
    return [1] if n == 1 
    return [1, 1] if n == 2 
    previous = get_n_fibonaccis(n - 1) 
    previous << previous[-1] + previous[-2]
  end
  
  def self.even_fibonacci(nth)
    raise 'Input must be a number' if !nth.is_a? Numeric
    raise 'Input must be a positive number' if nth < 0
    get_n_fibonaccis(nth).select { |num| num % 2 == 0 }.inject(:+)
  end

end
