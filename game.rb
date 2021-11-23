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
    bool = super
    # check_publish = year - @publish_date['year'] > 10
    # check_last_played = year - @last_played_at > 2
    year - @last_played_at > 2 && bool ? true : false
  end
end
