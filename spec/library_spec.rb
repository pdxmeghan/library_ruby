require 'rspec'
require 'patron'
require 'book'

describe 'Book' do
  it 'is initialized with a title and author' do
    test_book = Book.new("To Kill a Mockingbird", "Harper Lee")
    expect(test_book).to be_an_instance_of Book
  end

  it 'lets you read the book"s information' do
    test_book = Book.new("To Kill a Mockingbird", "Harper Lee")
    expect(test_book.information).to eq "To Kill a Mockingbird by Harper Lee"
  end

  it 'adds a due date to a book' do
    test_book = Book.new("To Kill a Mockingbird", "Harper Lee")
    test_book.add_due_date("11/1/2014")
    expect(test_book.due_date).to eq "11/1/2014"
  end
end

