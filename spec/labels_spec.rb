require_relative 'spec_helper'

RSpec.describe Label do
  before :each do
    @label = Label.new('Important', 'red')
    @book = Book.new({ day: 12, month: 8, year: 1950 }, 'Mondadori', 'good')
  end
  it 'Creates a Label object from parameters' do
    expect(@label).to be_an_instance_of Label
  end

  it 'Check for the title of the label' do
    expect(@label.title).to eql 'Important'
  end

  it 'Assign a book to the label' do
    @label.add_item(@book)
    expect(@book.label).to eql @label
  end
end
