require "byebug"
class StringConvertor
    def self.convert(numbers = nil)
        begin
            return 0 if numbers.empty?

            delimeter = fetch_delimiter(numbers)
            number_list = build_number_list(delimeter, numbers)
            check_for_negatives(number_list)
            return number_list.map(&:to_i).sum
        rescue Exception => e
            raise e.message
        end
    end

    def self.fetch_delimiter(numbers)
        delimeter = ","
        updated_delimeter = nil
        if numbers.start_with?("//")
            match = numbers.match(/^\/\/(.+?)\n(.*)$/)
            updated_delimeter = match[1]
            numbers = match[2]
        end
        delimeter = updated_delimeter if !updated_delimeter.nil?
        return delimeter
    end

    def self.build_number_list(delimeter, numbers)
        numbers = numbers.gsub("\n", delimeter)
        number_list = numbers.split(delimeter)
        number_list
    end

    def self.check_for_negatives(number_list)
        negatives = number_list.select { |num| num.to_i < 0 }.map(&:to_i)
        if negatives.any?
            raise "negative numbers not allowed #{negatives.join(',')}" 
        end

    end
end