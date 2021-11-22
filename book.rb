require_relative 'item'

class Book < Item
    def initialize(publish_date,publisher, cover_state)
        super(publish_date)
        @archivable = can_be_archived?
        @publisher = publisher
        @cover_state = cover_state

    end
    attr_reader :publisher, :cover_state, :archivable, :publish_date

    private
    def can_be_archived?
        return true if @archivable == true || @cover_state == 'bad'
        false
    end
end