def get_word_entries(input_string)
  result = Hash.new
  input_string_words = input_string.downcase.scan(/[a-z']+/)
  input_string_words.each do |word|
    if result.key? word
      result[word] += 1
    else result[word] = 1
    end
  end

  result.sort_by {|k,v| v}.reverse
end

$/ = "\n\n"
puts "Введіть текст:"
input = STDIN.gets.gsub("\n", ' ').squeeze(' ')
words_hash = get_word_entries(input)
if words_hash.empty?
  puts "\nУ тексті немає жодного слова"
else
  puts "\nНайкращі результати: "
  words_hash[0..2].each do |k,v|
    puts "Слово [#{k}] -> #{v} раз(ів)"
  end
end
