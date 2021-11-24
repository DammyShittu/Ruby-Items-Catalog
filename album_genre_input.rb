require_relative 'validator'
require_relative 'music_album'
require_relative 'genre'

module HandleAlbumAndGenreInput
  include Validator

  def list_all_albums
    puts 'No music album has been added yet! Please, add one' if @albums.empty?
    @albums.each_with_index do |album, index|
      puts "#{index + 1}) #{album.name} album was published on #{album.publish_date[:year]}-#{album.publish_date[:month]}-#{album.publish_date[:day]} "\
           " | On Spotify: #{album.on_spotify} | Archivable : #{album.can_be_archived?} "
    end
  end

  def list_all_genres
    puts 'No genre yet! Kindly add one.' if @genres.empty?

    @genres.each_with_index do |genre, index|
      puts "#{index + 1}) Music Genre - #{genre.name}"
    end
  end

  def add_music_album
    puts 'Please, type the album name: '
    name =  gets.chomp
    album_day = validate_day('Please, enter the day the album was published (1-31)')
    album_month = validate_month('Please, enter the month the album was published (1-12)')
    album_year = validate_year('Please, enter the year the album was published')
    date_of_publish = { day: album_day, month: album_month, year: album_year }

    spotify = validate_spotify_status('Is this album on spotify?(y/n)')

    @albums << MusicAlbum.new(name, date_of_publish, spotify)
    puts 'Album has been successfully created'
  end

  def create_genre
    print 'Please, enter the genre you want to create(Hip-hop, Rap, etc): '
    new_genre = gets.chomp
    @genres << Genre.new(new_genre)
    sleep 0.5
    puts "New genre [#{new_genre}] has been successfuly created"
  end
end
