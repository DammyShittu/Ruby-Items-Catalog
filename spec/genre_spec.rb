require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Pop')
    @album = MusicAlbum.new({ day: 31, month: 5, year: 2010 }, true)
  end

  it 'checks if genre is an instance of Genre class' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'confirms that the name of the genre is not Afrobeats' do
    expect(@genre.name).not_to be 'Afrobeats'
  end

  it 'expects items array to be empty' do
    expect(@genre.items).to be_empty
  end

  it 'adds album to the items array' do
    @genre.add_item(@album)
    expect(@album.genre).to eql @genre
  end

  it 'confirms there are two items in the array' do
    @album2 = @album = MusicAlbum.new({ day: 12, month: 5, year: 1997 }, false)
    @genre.add_item(@album)
    @genre.add_item(@album2)
    expect(@genre.items).to match_array([@album, @album2])
    expect(@genre.items).not_to be_empty
  end
end
