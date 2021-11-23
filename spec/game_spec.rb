require_relative '../game'
require_relative '../item'
require_relative '../author'

describe 'class Game' do
  before :each do
    @g1 = Game.new({ year: 2009 }, 2017)
  end

  it 'check @g1 is kind of Item class' do
    expect(@g1).to be_kind_of Item
  end

  it 'check @g1 publish date ' do
    expect(@g1.publish_date[:year]).to eq 2009
  end

  it 'check @g1 last played date ' do
    expect(@g1.last_played_at).to eq 2017
  end

  it 'check if should not moved to archive' do
    @g2 = Game.new({ year: 2009 }, 2020)
    expect(@g2.move_to_archive).to be nil
  end

  it 'check if should moved to archive' do
    expect(@g1.move_to_archive).to be true
  end

  it 'Check if game has an assigned artist' do
    @author1 = Author.new('F_name', 'L_name')
    @g1.add_item(@author1)
    expect(@g1.author).to be @author1
  end
end

describe 'Author Class' do
  before :each do
    @a1 = Author.new('Faizan', 'Zahid')
    @a2 = Author.new('First', 'Last')
    @game1 = Game.new({ year: 2010 }, 2015)
    @game2 = Game.new({ year: 2015 }, 2020)
    @game3 = Game.new({ year: 2000 }, 2010)
  end

  it('check the first name of @a1 obj') do
    expect(@a1.f_name).to eq 'Faizan'
  end

  it('check the last name of @a1 obj') do
    expect(@a1.l_name).to eq 'Zahid'
  end

  it('check the items is empty') do
    expect(@a1.items).to eq []
  end

  it('check if items in a1 include game1 and game2') do
    @a1.add_author(@game1)
    @a1.add_author(@game2)
    expect(@a1.items.length).to be 2
    expect(@game1.author).to be @a1
    expect(@game2.author).to be @a1
  end
end
