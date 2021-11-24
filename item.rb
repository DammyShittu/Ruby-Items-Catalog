class Item
  attr_accessor :publish_date, :archived, :label, :author, :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    can_be_archived? ? @archived = true : nil
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private

  def can_be_archived?
    year = Time.new.year
    year - @publish_date[:year] > 10
  end
end
