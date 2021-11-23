# rubocop:disable Metrics
module Storage
  def read_json_books
    books_json = File.read('./local/books.json')
    data_books = JSON.parse(books_json)
    data_books.each do |book|
    date = { day: book['publish_date']['day'], month: book['publish_date']['month'],
               year: book['publish_date']['year'] }
      add_book_input(date, book['publisher'], book['cover_state'])
    end
  end

  def read_json_labels
    labels_json = File.read('./local/labels.json')
    data_labels = JSON.parse(labels_json)
    data_labels.each { |label| create_label(label['title'], label['color']) }
  end
  
  def save_json
    File.new('./local/books.json', 'a') unless File.exist?('./local/books.json') || @books.empty?
    File.new('./local/labels.json', 'a') unless File.exist?('./local/labels.json') || @labels.empty?
    bks = []
    lbs = []
    @labels.each do |label|
      h = { title: label.title, color: label.color }
      lbs.push(h)
    end
    @books.each do |book|
      h = { publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state }
      bks.push(h)
    end
    File.write('./local/books.json', JSON.dump(bks)) unless @books.empty?
    File.write('./local/labels.json', JSON.dump(lbs)) unless @labels.empty?
  end
end

# rubocop:enable Metrics
