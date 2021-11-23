require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @album1 = MusicAlbum.new({ day: 17, month: 10, year: 1988 }, false)
    @album2 = MusicAlbum.new({ day: 31, month: 5, year: 2010 }, true)
  end

  it 'checks if album_1 is an instance of the MusicAlbum class' do
    expect(@album1).to be_an_instance_of MusicAlbum
  end

  it 'checks if album_2 is an instance of the MusicAlbum class' do
    expect(@album2).to be_an_instance_of MusicAlbum
  end

  it 'confirms album_3 is not an instance of the MusicAlbum class' do
    expect(@album3).not_to be_an_instance_of MusicAlbum
  end

  it 'checks if album1 can be archived' do
    expect(@album1.can_be_archived?).to be_falsy
  end

  it 'checks if album2 can be archived' do
    expect(@album2.can_be_archived?).to be_truthy
  end

  it 'confirms that the on_spotify attribute of album1 is not true' do
    expect(@album1.on_spotify).not_to be true
  end

  it 'confirms that the on_spotify attribute of album2 is true' do
    expect(@album2.on_spotify).to be true
  end

  it 'confirms that the published year of album1 is not 1978' do
    expect(@album1.publish_date[:year]).to be 1988
  end

  it 'confirms that the published year of album2 is not 2013' do
    expect(@album2.publish_date[:year]).not_to be 2013
  end
end
