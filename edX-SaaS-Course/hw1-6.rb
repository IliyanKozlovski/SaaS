class Numeric
    @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub(/s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end
    def in(target_currency)
        singular_currency = target_currency.to_s.gsub(/s$/, '')
        self / @@currencies[singular_currency]
    end
end


class String
   def palindrome?
    string = self
    string.downcase!
    string.gsub!(/\W/, "")
    return string == string.downcase.reverse
   end
end

module Enumerable
    def palindrome?
            return self.to_a == self.to_a.reverse
    end
end
