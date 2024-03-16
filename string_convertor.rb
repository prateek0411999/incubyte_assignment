class StringConvertor
    def self.convert(numbers = nil)
        return 0 if numbers.empty?

        return numbers.to_i if numbers.split(",").length <= 1
    end
end