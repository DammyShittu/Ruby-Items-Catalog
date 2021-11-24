require './item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer, :author

  def initialize(publish_date, last_played_at, multiplayer: false)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    year = Time.new.year
    bool = super
    check_last_played = year - @last_played_at[:year] > 2
    check_last_played && bool
  end

  def add_author(author)
    author.add_item(self) unless author.items.include?(self)
  end
end
