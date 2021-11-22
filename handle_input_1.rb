module Handle_input_1
    def add_book_input(publish_date,publisher,cover)
        @books << Book.new(publish_date,publisher, cover)
    end

    def show_books
        @books.each_with_index {|book,index| puts "#{index+1} | Book published by #{book.publisher} on #{book.publish_date[:year]} condition: #{book.cover_state}"} unless @books.empty?
    end
end