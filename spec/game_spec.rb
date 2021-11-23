require_relative '../game'
require_relative '../item'

describe 'class Game' do
  before :each do
    @g1 = Game.new({ 'year' => 2009 }, 2017)
  end

  it 'check @g1 is kind of Item class' do
    expect(@g1).to be_kind_of Item
  end

  it 'check @g1 publish date ' do
    expect(@g1.publish_date['year']).to eq 2009
  end

  it 'check @g1 last played date ' do
    expect(@g1.last_played_at).to eq 2017
  end

  it 'check if should not moved to archive' do
    @g2 = Game.new({ 'year' => 2009 }, 2020)
    expect(@g2.move_to_archive).to be nil
  end

  it 'check if should moved to archive' do
    expect(@g1.move_to_archive).to be true
  end
end
