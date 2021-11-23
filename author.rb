require_relative 'game'
class Author
  attr_accessor :f_name, :l_name, :items
  def initialize(f_name, l_name)
    @f_name = f_name
    @l_name = l_name
    @items = []
  end
  def add_author(game)
    game.author = self
    @items << game
  end
end
