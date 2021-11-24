require_relative 'label'
# rubocop: disable Metrics
module HandleInput1
  def add_book_input(publish_date, publisher, cover)
    @books << Book.new(publish_date, publisher, cover)
    puts 'Book created succesfully!'
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

  def create_book
    day_input = validate_day('Insert the day of publishment (1-31)')
    month_input = validate_month('Insert the month of publishment(1-12)')
    year_input = validate_year('Insert the year of publishment')
    date = { day: day_input, month: month_input, year: year_input }
    puts 'Insert the publisher: '
    publisher = gets.chomp
    puts 'Insert the state of the cover: '
    cover = gets.chomp
    add_book_input(date, publisher, cover)
  end

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

  def create_label(title, color)
    @labels << Label.new(title, color)
  end

  def show_labels
    if @books.empty?
      puts 'No label to be listed'
    else
      @labels.each_with_index do |label, index|
        str = label.color
        puts "#{index + 1} | Label title: #{label.title} | Color: #{(label.color).send(str)}"
      end
    end
  end

  def ask_book_input
    show_books
    puts 'Select the index of the book to change: '
    ind = gets.chomp.to_i - 1
    if @books[ind] && ind != -1
      show_labels
      ind
    else
      puts "The book that you selected doesn't exist"
      enter
      ask_book_input
    end
  end

  def create_label_input
    puts 'Insert title of the label:'
    name = gets.chomp
    puts "Select a color for the label: \n#{'Red'.red}\n#{'Green'.green}\n#{'Yellow'.yellow}\n"\
         "#{'Blue'.blue}\n#{'Pink'.pink}"
    color = validate_color('Color selection: ')
    puts color
    create_label(name, color)
    puts "Label #{name} succesfully created"
    enter
  end

  def set_label(ind, ind2)
    if ind != -1 && ind2 != -1
      if @labels[ind2]
        if @labels[ind2].items.include? @books[ind]
          puts "Book already labeled as #{@labels[ind2].title}"
          enter
          run
        else
          @labels[ind2].add_item(@books[ind])
          @labels.each_with_index do |label, index|
            (label.items.include? @books[ind]) && (index != ind2) ? label.items.delete(@books[ind]) : nil
          end
          puts "Label #{@labels[ind2].title} assigned to the book published by #{@books[ind].publisher}"
          enter
        end
      else
        puts "The label you selected doesn't exist"
        enter
        show_labels
        puts 'Select the label to be assigned: '
        ind2 = gets.chomp.to_i
        set_label(ind, ind2 - 1)
      end
    else
      puts 'Invalid input'
    end
  end

  def show_label_items
    show_labels
    puts 'Select the label to show its items: '
    gets.chomp.to_i
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
# rubocop: enable Metrics
