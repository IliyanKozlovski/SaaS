def palindrome?(string)
    string.downcase!
    string.gsub!(/\W/, "")
    string == string.downcase.reverse
end

def count_words(string)
    res = Hash.new(0)
    string.downcase.scan(/\w+/) do |word|
        res[word] += 1
    end
    return res
end
