require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :archivable, :publish_date
  attr_accessor :archived

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @archivable = false
    @publisher = publisher
    @cover_state = cover_state
    can_be_archived?
  end

  private

  def can_be_archived?
    bool = super
    @archivable = bool || @cover_state.downcase.eql?('bad')
  end
end
