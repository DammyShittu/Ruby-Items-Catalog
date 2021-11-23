require_relative 'label'
module HandleInput1
  def add_book_input(publish_date, publisher, cover)
    @books << Book.new(publish_date, publisher, cover)
  end

  def show_books
    if @books.empty?
      puts 'No book to be listed'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1} | Book published by #{book.publisher} in "\
             "#{book.publish_date[:year]} | Condition: #{book.cover_state} "\
             "| Archivable: #{book.archivable} | Archived: #{book.archived}"
      end
    end
  end

  # rubocop: disable Metrics
  def move_book_to_archive
    archivable = []
    @books.each { |book| book.archivable && book.archived == false ? archivable << book : nil }
    if archivable.empty?
      puts 'No book to be listed!'
    else
      puts 'Archivable books:'
      archivable.each_with_index do |book, index|
        puts "#{index + 1} | Book published by #{book.publisher} in #{book.publish_date[:year]}"
      end
      puts 'Select an index: '
      option = gets.chomp.to_i - 1
      if archivable[option] && option != -1
        (archivable[option].move_to_archive
         puts 'Book archived succesfully'
        )
      else
        puts "You selected a book that doesn't exist"
      end
    end
    enter
  end
  # rubocop: enable Metrics

  def create_label(title, color)
    @labels << Label.new(title, color)
  end

  def show_labels
    @labels.each_with_index do |label, index|
      str = label.color
      puts "#{index + 1} | Label title: #{label.title} | Color: #{(label.color).send(str)}"
    end
  end

  def get_label(ind)
    if @books[ind]
      show_labels
    else
      (puts "The book that you selected doesn't exist"
       enter)
    end
  end

  def set_label(ind, ind2)
    if ind != -1 && ind2 != -1
      if @labels[ind2]
        @labels[ind2].add_item(@books[ind])
      else
        (puts "The label you selected doesn't exist"
         enter)
      end
      puts "Label #{@labels[ind2].title} assigned to the book published by #{@books[ind].publisher}"
    else
      puts 'Invalid input'
    end
    enter
  end

  def show_items_by_label(ind)
    if @labels[ind] && ind != -1
      if @labels[ind].items.empty? == false
        @labels[ind].items.each_with_index do |book, index|
          puts "#{index + 1} | Book published by #{book.publisher} in "\
               "#{book.publish_date[:year]} | Condition: #{book.cover_state} "\
               "| Archivable: #{book.archivable} | Archived: #{book.archived}"
        end
      else
        puts "Label doesn't have any item"
      end
    else
      puts "The label you selected doesn't exist"
    end
    enter
  end
end
