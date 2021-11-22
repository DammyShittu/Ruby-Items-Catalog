require_relative 'book'
require_relative 'handle_input_1'
require_relative 'validator'
require_relative 'color'
# rubocop: disable Metrics
class App
include Handle_input_1
include Validator
    def initialize
        @books = []
        @labels = []
    end
  def run
    choose_options = %(
      1 - List all books
      2 - List all music albums
      3 - List all games
      4 - List all genres
      5 - List all labels
      6 - List all authors
      7 - Add a book
      8 - Add a music album
      9 - Add a game
      10- Exit
    ).split('\n')
    loop do
      puts 'Select an option'
      choose_options.map { |choose| puts choose }
      print 'Your Choice: '
      user_input = gets.chomp.to_i

      if user_input == 10
        puts 'Thank you for using this app'
        break
      end
      puts "\n"
      options user_input
    end
  end

  def enter
    puts 'Press enter to continue'
    gets
    puts
  end

  def options(input)
    case input
    when 1
      show_books
      enter
    when 2
      puts 'list_music_albums'
      enter
    when 3
      puts 'list_games'
      enter
    when 4
      puts 'list_genres'
      enter
    when 5
      show_labels
      enter
    when 6
      puts 'list_authors'
      enter
    when 7
      day_input = validate_day('Insert the day of publishment (1-31)')
      month_input = validate_month('Insert the month of publishment(1-12)')
      year_input = validate_year('Insert the year of publishment')
      date = { day: day_input, month: month_input, year: year_input }
      puts 'Insert the publisher: '
      publisher = gets.chomp
      puts 'Insert the state of the cover: '
      cover = gets.chomp
      add_book_input(date,publisher, cover)
    when 8
      puts 'add_music_album'
    when 9
      puts 'add_game'
    when 11
        move_book_to_archive
    when 12
        puts "Insert name of the label:"
        name = gets.chomp
        puts "Select a color for the label: \n#{'Red'.red}\n#{'Green'.green}\n#{'Yellow'.yellow}\n#{'Blue'.blue}\n#{'Pink'.pink}\n#{'Light Blue'.light_blue}"
        color = gets.chomp
        create_label(name,color)
    else
      puts 'Invalid input'
      run
    end
  end
end

def main
  new_app = App.new
  puts 'Welcome to the catalog of my things!'
  new_app.run
end

# rubocop: enable Metrics
main
