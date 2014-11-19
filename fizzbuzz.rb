def fizzbuzz(num)
  (1..num).each do |n|
    print "Fizz" if n % 3 == 0
    print "Buzz" if n % 5 == 0
    print n if !(n % 3 == 0 || n % 5 == 0)
    print "\n"
  end
end

def fizzbuzz_boolean(num)
  (1..num).each do |i|
    fizz = i % 3 == 0 
    buzz = i % 5 == 0
    puts(fizz && buzz ? "FizzBuzz" : fizz ? "Fizz" : buzz ? "Buzz" : i);
  end
end

def recursive_fizzbuzz(num)
  recursive_fizzbuzz(num-1) if num > 1
  fizz = num % 3 == 0 
  buzz = num % 5 == 0
  puts(fizz && buzz ? "FizzBuzz" : fizz ? "Fizz" : buzz ? "Buzz" : num);
end

def fizzbuzz_times(num)
  num.times do |n|
    x = n + 1
    print "Fizz" if x % 3 == 0
    print "Buzz" if x % 5 == 0
    print x if !(x % 3 == 0 || x % 5 == 0)
    print "\n"
  end
end

def sticker(word)
  sticker_hash = build_dictionary("WPENGINE".downcase)
  word_hash = build_dictionary(word.downcase)
  if !((word_hash.keys - sticker_hash.keys).empty?)
    puts "Impossible to form #{word} from 'WPENGINE' stickers"
    return
  end
  counter = 1
  word_hash.each_key do |letter|
    while word_hash[letter] > sticker_hash[letter] * counter
      counter += 1
    end
  end
  puts counter
end

def build_dictionary(word)
  hash_of_word = Hash.new(0)
  word.split('').each {|let| hash_of_word[let] += 1 }
  return hash_of_word
end

def sticker_with_marco(word)
  counter = 1
  sticker = {'w': 1..}
  original = {'w': 1...}
  word.split('').each do |letter|
    if sticker[letter].nil?
      return error
    elsif sticker[letter] > 0
      sticker[letter] -= 1
    else 
      original.each do |key,val|
        sticker[key] += val
      end
      counter += 1
      sticker[letter] -= 1
    end
  end
  return counter
end