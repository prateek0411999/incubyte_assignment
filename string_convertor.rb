require "byebug"
class StringConvertor
    def self.convert(numbers = nil)
        return 0 if numbers.empty?

        delimeter = ","
        updated_delimeter = nil
        if numbers.start_with?("//")
            match = numbers.match(/^\/\/(.+?)\n(.*)$/)
            updated_delimeter = match[1]
            numbers = match[2]
        end
        delimeter = updated_delimeter if !updated_delimeter.nil?
        
        numbers = numbers.gsub("\n", delimeter)
        number_list = numbers.split(delimeter)

        negatives = number_list.select { |num| num.to_i < 0 }.map(&:to_i)
        if negatives.any?
          raise "negative numbers not allowed #{negatives.join(',')}"
        end

        return number_list.map(&:to_i).sum
    end
end