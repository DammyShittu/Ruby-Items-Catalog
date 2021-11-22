# rubocop: disable Metrics
class App
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
      puts 'list_books'
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
      puts 'list_labels'
      enter
    when 6
      puts 'list_authors'
      enter
    when 7
      puts 'add_book'
    when 8
      puts 'add_music_album'
    when 9
      puts 'add_game'
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
