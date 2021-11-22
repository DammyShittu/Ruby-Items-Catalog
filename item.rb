class Item
  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @label = nil
    @author = nil
    @genre = nil
  end

  attr_accessor :archived, :label, :author, :genre

  def move_to_archive
    can_be_archived? ? @archived = true : nil
  end

  private

  def can_be_archived?
    year = Time.new.year
    return year - @publish_date[:year] > 10 ? true : false
  end
end
