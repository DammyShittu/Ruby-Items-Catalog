# rubocop: disable Layout/LineLength
module SaveToJson
  def read_authors
    fetch_authors_json = File.read('author.json')
    parse_json = JSON.parse(fetch_authors_json)
    parse_json.each do |author|
      first = author['f_name']
      last = author['l_name']
      items_list = author['items']
      new_author = Author.new(first, last)
      if items_list.length.positive?
        items_list.each do |item|
          publish_on, last_played_on, multiplayer = read_dates(item)
          game = Game.new(publish_on, last_played_on)
          game.multiplayer = multiplayer
          new_author.items.push(game)
        end
      end
      @authors << new_author
    end
  end

  def read_games
    fetch_games_json = File.read('games.json')
    parse_json = JSON.parse(fetch_games_json)
    parse_json.each do |game|
      publish_on, last_played_on, multiplayer = read_dates(game)
      new_game = Game.new(publish_on, last_played_on)
      new_game.multiplayer = true if multiplayer
      @games << new_game
    end
  end

  def read_dates(obj)
    publish_on = { year: obj['publish_date']['year'], month: obj['publish_date']['month'],
                   day: obj['publish_date']['day'] }
    last_played_on = { year: obj['last_played_at']['year'], month: obj['last_played_at']['month'],
                       day: obj['last_played_at']['day'] }
    multiplayer = obj['multiplayer']
    [publish_on, last_played_on, multiplayer]
  end

  def save_games_authors
    write_authors(@authors)
    write_games(@games)
  end

  def write_games(games_list)
    json_games = []
    if games_list.length.positive?
      games_list.each do |game|
        add = { publish_date: game.publish_date, last_played_at: game.last_played_at, multiplayer: game.multiplayer }
        json_games.push(add)
      end
    end
    games_file(json_games) if File.exist?('games.json')
    File.new('games.json', 'w')
    games_file(json_games)
  end

  def games_file(json_games)
    File.write('games.json', JSON.dump(json_games)) if json_games.length.positive?
    File.write('games.json', []) if json_games.empty?
  end

  def write_authors(authors_list)
    json_authors = []
    if authors_list.length.positive?
      authors_list.each do |author|
        if author.items.length.positive?
          obj = []
          author.items.each do |item|
            obj.push({ publish_date: item.publish_date, last_played_at: item.last_played_at,
                       multiplayer: item.multiplayer })
          end
          add = { f_name: author.f_name, l_name: author.l_name, items: obj }
        else
          add = { f_name: author.f_name, l_name: author.l_name, items: [] }
        end
        json_authors.push(add)
      end
    end
    author_file(json_authors) if File.exist?('author.json')
    File.new('author.json', 'w')
    author_file(json_authors)
  end

  def author_file(json_authors)
    File.write('author.json', JSON.dump(json_authors)) if json_authors.length.positive?
    File.write('author.json', []) if json_authors.empty?
  end
end

# rubocop: enable Layout/LineLength
