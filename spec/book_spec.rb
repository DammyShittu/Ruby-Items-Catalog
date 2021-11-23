require_relative 'spec_helper'

RSpec.describe Book do
  before :each do
    @book1 = Book.new({ day: 12, month: 8, year: 1950 }, 'Mondadori', 'good')
    @book2 = Book.new({ day: 16, month: 12, year: 2020 }, 'Feltrinelli', 'bad')
    @book3 = Book.new({ day: 10, month: 1, year: 2020 }, 'Amazon', 'good')
  end
  it 'Creates a Book object from parameters' do
    @book1.should be_an_instance_of Book
    @book2.should be_an_instance_of Book
    @book3.should be_an_instance_of Book
  end

  it 'Check for the publisher of the book' do
    @book1.publisher.should eql 'Mondadori'
    @book2.publisher.should eql 'Feltrinelli'
  end

  it 'Check if the book is archivable' do
    @book1.archivable.should be_truthy
    @book2.archivable.should be_truthy
    @book3.archivable.should be_falsey
  end
end
