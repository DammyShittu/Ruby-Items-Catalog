module Validator
    def validate_year(str)
        puts str
        year_input = gets.chomp.to_i
        return year_input.digits.count == 4 && year_input.positive? ? year_input : validate_year('Wrong input, please try again')
    end
    def validate_month(str)
        puts str
        month_input = gets.chomp.to_i
        return month_input >=1 && month_input <= 12 ? month_input : validate_month('Wrong input, please try again')
    end
    def validate_day(str)
        puts str
        day_input = gets.chomp.to_i
        return day_input >=1 && day_input <= 31 ? day_input : validate_day('Wrong input, please try again')
    end

    def validate_color(str)
        colors = ['red','blue','green','yellow','pink','light blue']
        puts str
        color = gets.chomp.downcase
        return colors.any?(color) ? color : validate_color('Please select a color from the available list')

    end
end