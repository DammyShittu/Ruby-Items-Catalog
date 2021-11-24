require './game'
require './author'

module GameModule
  def game_info
    puts 'When was this game published'
    date_of_publish = input_date('of Publish')
    puts 'When did you last play this game?'
    date_last_played = input_date('when last played')
    puts 'Is multiplayer'
    bool = validate_bool_input("Insert 'Y' if Mulitplayer, 'N' if not")
    game = Game.new(date_of_publish, date_last_played)
    game.multiplayer = bool if bool
    @games << game
    puts 'Do you know author of the game?'
    know_author = validate_bool_input("Insert 'Y' if Yes, 'N' if not")
    if know_author
      puts 'Lets create an Author for this game'
      create_author(game)
      puts 'Game and Author created successfully'
    else
      puts 'No worries!! You can always create it later by using "16" option.'
      puts 'Game created successfully'
    end
  end

  def input_date(val)
    year_input = validate_year("Input year #{val}")
    month_input = validate_month("Input month #{val}")
    day_input = validate_day("Input day #{val}")
    {
      year: year_input,
      month: month_input,
      day: day_input
    }
  end

  def create_author(game)
    first, last = author_input
    author = Author.new(first, last)
    @authors.push(author)
    game.add_author(author)
  end

  def create_new_author
    first, last = author_input
    author = Author.new(first, last)
    @authors.push(author)
    puts 'Author created successfully'
  end

  def validate_author(first, last)
    @authors.each do |author_match|
      author_match.f_name == first && author_match.l_name == last ? [true, author_match] : [false, 'new author created']
    end
  end

  def author_input
    puts 'Please add first name of the author'
    first = gets.chomp
    puts 'Please add last name of the author'
    last = gets.chomp
    [first, last]
  end
end
