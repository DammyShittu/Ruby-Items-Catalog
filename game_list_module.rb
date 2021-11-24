module DisplayList
  # rubocop: disable Layout/LineLength
  def display_games
    puts 'No Games to display' if @games.empty?
    @games.each_with_index do |game, i|
      game.move_to_archive
      play_date = game.last_played_at
      date_obj = game.publish_date
      puts "#{i + 1} - Published on: #{date_obj[:year]}/#{date_obj[:month]}/#{date_obj[:day]} | Last Played: #{play_date[:year]}/#{play_date[:month]}/#{play_date[:day]} | Archived: #{game.archived}"
    end
    puts ' -------------------------------- '
  end

  def display_authors
    puts 'No Authors to display' if @authors.empty?
    @authors.each_with_index do |val, i|
      puts "#{i + 1} - #{val.f_name} #{val.l_name} author of following games"
      puts 'This author has no games to show' if val.items.empty?
      val.items.each_with_index do |game, j|
        published_on = game.publish_date
        puts "Game #{j + 1} - Published on #{published_on[:year]}/#{published_on[:month]}/#{published_on[:day]}"
      end
    end
    puts ' -------------------------------- '
  end
  # rubocop: enable Layout/LineLength
end
