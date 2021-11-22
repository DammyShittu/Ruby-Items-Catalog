require_relative 'book'
require_relative 'handle_input_1'
require_relative 'validator'
require_relative 'color'
require_relative 'storage'
require 'json'

# rubocop: disable Metrics
class App
include Handle_input_1
include Validator
include Storage
    def initialize
        @books = []
        @labels = []
        read_json_books if File.exist?('./local/books.json')
        read_json_labels if File.exist?('./local/labels.json')
        # read_json_labels
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

      TEMPORARY
      11 - Move a book to the archive
      12 - Create a new label
      13 - Assign a label to a book
      14 - Show items by label
    ).split('\n')
    loop do
      puts 'Select an option'
      choose_options.map { |choose| puts choose }
      print 'Your Choice: '
      user_input = gets.chomp.to_i

      if user_input == 10
        puts 'Thank you for using this app'
        save_json
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
        puts "Insert title of the label:"
        name = gets.chomp
        puts "Select a color for the label: \n#{'Red'.red}\n#{'Green'.green}\n#{'Yellow'.yellow}\n#{'Blue'.blue}\n#{'Pink'.pink}"
        color = validate_color('Color selection: ')
        puts color
        create_label(name,color)
        puts "Label #{name} succesfully created"
        enter
    when 13
        show_books
        puts "Select the index of the book to change: "
        ind = gets.chomp.to_i
        get_label(ind-1)
        puts "Select the label to be assigned: "
        ind2 = gets.chomp.to_i
        set_label(ind-1,ind2-1)
    when 14
        show_labels
        puts "Select the label to show its items: "
        option = gets.chomp.to_i
        show_items_by_label(option-1)
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
