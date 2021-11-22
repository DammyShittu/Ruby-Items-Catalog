module Handle_input_1
    def add_book_input(publish_date,publisher,cover)
        @books << Book.new(publish_date,publisher, cover)
        puts "Cover state is #{cover}"
    end

    def show_books
        puts @books[0].publish_date[year]
        @books.each_with_index {|book,index| puts "#{index+1} | Book published by #{book.publisher} on #{book.publish_date[:year]} condition: #{book.cover_state}"} unless @books.empty?
    end

    def move_book_to_archive
        archivable = []
        @books.each {|book| book.archivable ? archivable << book : nil}
        puts "Archivable books:"
        archivable.each {|book| puts "#{book.publisher}"}
    end
end