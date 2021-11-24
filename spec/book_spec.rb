require_relative 'spec_helper'

RSpec.describe Book do
  before :each do
    @book1 = Book.new({ day: 12, month: 8, year: 1950 }, 'Mondadori', 'good')
    @book2 = Book.new({ day: 16, month: 12, year: 2020 }, 'Feltrinelli', 'bad')
    @book3 = Book.new({ day: 10, month: 1, year: 2020 }, 'Amazon', 'good')
  end
  it 'Creates a Book object from parameters' do
    expect(@book1).to be_an_instance_of Book
    expect(@book2).to be_an_instance_of Book
    expect(@book3).to be_an_instance_of Book
  end

  it 'Check for the publisher of the book' do
    expect(@book1.publisher).to eql 'Mondadori'
    expect(@book2.publisher).to eql 'Feltrinelli'
  end

  it 'Check if the book is archivable' do
    expect(@book1.archivable).to be_truthy
    expect(@book2.archivable).to be_truthy
    expect(@book3.archivable).to be_falsey
  end
end
