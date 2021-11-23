require_relative 'item'

class Book < Item
  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @archivable = false
    @publisher = publisher
    @cover_state = cover_state
    can_be_archived?
  end
  attr_reader :publisher, :cover_state, :archivable, :publish_date
  attr_accessor :archived

  private

  def can_be_archived?
    bool = super
    @archivable = if bool || @cover_state.downcase.eql?('bad')
                    true
                  else
                    false
                  end
  end
end
