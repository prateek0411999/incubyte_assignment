class StringConvertor
    def self.convert(numbers = nil)
        return 0 if numbers.empty?

        delimeter = ","
        
        numbers = numbers.gsub("\n", delimeter)
        number_list = numbers.split(",")
        
        return number_list.map(&:to_i).sum
    end
end