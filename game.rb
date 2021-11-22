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
    check_publish = year - @publish_date > 10
    check_last_played = year - @last_played_at > 2
    if check_last_played && check_publish
      true
    else
      false
    end
  end
end
