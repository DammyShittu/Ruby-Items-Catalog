module Validator
    def validate_year
        puts 'Insert the year of publishment'
        year_input = gets.chomp.to_i
        return year_input.digits.count == 4 && year_input.positive? ? year_input : validate_year
    end
    def validate_month
        puts 'Insert the month of publishment'
        month_input = gets.chomp.to_i
        return month_input >=1 && month_input <= 12 ? month_input : validate_month
    end
    def validate_day
        puts 'Insert the day of publishment'
        day_input = gets.chomp.to_i
        return day_input >=1 && day_input <= 31 ? day_input : validate_day
    end
end