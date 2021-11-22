require_relative 'label'
module Handle_input_1
    def add_book_input(publish_date,publisher,cover)
        @books << Book.new(publish_date,publisher, cover)
    end

    def show_books
        @books.each_with_index {|book,index| puts "#{index+1} | Book published by #{book.publisher} in "\
        "#{book.publish_date[:year]} | Condition: #{book.cover_state} | Archivable: #{book.archivable} | Archived: #{book.archived}"} unless @books.empty?
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
        @labels.each_with_index {|label,index| str = label.color
        puts "#{index+1} | Label title: #{label.title} | Color: #{(label.color).send(str)}"}
    end
end