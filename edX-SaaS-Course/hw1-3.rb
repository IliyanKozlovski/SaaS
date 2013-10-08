def combine_anagrams(words)
    res = []
    words.each do |word| 
        tmp = []
        words.each do |other|
            if word.downcase.chars.sort.join == other.downcase.chars.sort.join
                tmp[tmp.length] = other
            end
        end
        res[res.length] = tmp
    end

    return res.uniq
end
