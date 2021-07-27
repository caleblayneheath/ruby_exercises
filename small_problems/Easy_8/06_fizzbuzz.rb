def fizzbuzz(start_num, end_num)
  (start_num..end_num).each do |num|
    case 
    when num % 5 == 0 && num % 3 == 0
      puts 'FizzBuzz'
    when num % 5 == 0
      puts 'Fizz'
    when num % 3 ==0 
      puts 'Buzz'
    else
      puts num
    end
  end
end

fizzbuzz(1, 15)