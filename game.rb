require './item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(publish_date, last_played_at, multiplayer: false)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    year = Time.new.year
    check_last_played = year - @last_played_at > 2
    check_last_played && super ? true : false
  end
end

g1 = Game.new(2002, 2017)
puts g1.move_to_archive
