# rubocop:disable Metrics

require_relative 'music_album'
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

  def read_json_musicalbum
    file = './local/music_album.json'

    JSON.parse(File.read(file)).each do |album|
      date = { day: album['publish_date']['day'], month: album['publish_date']['month'],
        year: album['publish_date']['year'] }
      @albums << MusicAlbum.new(date, album['on_spotify'])
    end
  end

  def save_json
    File.new('./local/books.json', 'a') unless File.exist?('./local/books.json') || @books.empty?
    File.new('./local/labels.json', 'a') unless File.exist?('./local/labels.json') || @labels.empty?
    File.new('./local/music_album.json', 'a') unless File.exist?('./local/music_album.json') || @albums.empty?
    bks = []
    lbs = []
    music_album = []
    @labels.each do |label|
      h = { title: label.title, color: label.color }
      lbs.push(h)
    end

    @books.each do |book|
      h = { publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state }
      bks.push(h)
    end

    @albums.each do |album|
      album_hash = { publish_date: album.publish_date, on_spotify: album.on_spotify }
      music_album.push(album_hash)
    end

    File.write('./local/books.json', JSON.dump(bks)) unless @books.empty?
    File.write('./local/labels.json', JSON.dump(lbs)) unless @labels.empty?
    File.write('./local/music_album.json', JSON.dump(music_album)) unless @albums.empty?
  end
end

# rubocop:enable Metrics
