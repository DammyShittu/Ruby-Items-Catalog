module Handle_input_1
    def add_book_input(publish_date,publisher,cover)
        @books << Book.new(publish_date,publisher, cover)
        puts "Cover state is #{cover}"
    end

    def show_books
        @books.each_with_index {|book,index| puts "#{index+1} | Book published by #{book.publisher} in "\
        "#{book.publish_date[:year]} condition: #{book.cover_state} | Archivable: #{book.archivable} | Archived: #{book.archived}"} unless @books.empty?
    end

    def move_book_to_archive
        archivable = []
        @books.each {|book| book.archivable && book.archived == false ? archivable << book : nil}
        if archivable.empty?
            puts "No book to be listed!"
            enter
        else 
            puts "Archivable books:"
            archivable.each_with_index {|book,index| puts "#{index+1} | Book published by #{book.publisher} in #{book.publish_date[:year]}"}
            puts "Select an index: "
            option = gets.chomp.to_i-1
            archivable[option] ? (archivable[option].move_to_archive 
            puts "Book archived succesfully" 
            enter) : (puts "You selected a book that doesn't exist"
            enter)
        end
    end

    def create_label(title,color)
        @labels << Label.new(title,color)
    end

    def show_labels

    end

end