require 'rspec'
require 'patron'
require 'book'

describe 'Book' do
  it 'is initialized with a title and author' do
    test_book = Book.new("To Kill a Mockingbird", "Harper Lee")
    expect(test_book).to be_an_instance_of Book
  end

  it "lets you read the book's information" do
    test_book = Book.new("To Kill a Mockingbird", "Harper Lee")
    expect(test_book.information).to eq "To Kill a Mockingbird by Harper Lee"
  end

  it 'adds a due date to a book' do
    test_book = Book.new("To Kill a Mockingbird", "Harper Lee")
    test_book.add_due_date("11/1/2014")
    expect(test_book.due_date).to eq "11/1/2014"
  end
end

describe 'Patron' do
  describe '.clear' do
    it 'empties out all saved Patrons' do
      Patron.new("Jane Doe").save
      Patron.clear
      expect(Patron.all).to eq []
    end
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Patron.all).to eq []
    end
  end

  describe 'save' do
    it 'adds a patron to the list of all patrons' do
      test_patron = Patron.new("Jane Doe")
      test_patron.save
      expect(Patron.all).to eq [test_patron]
    end
  end

  it 'is initialized with a name' do
    test_patron = Patron.new("Jane Doe")
    expect(test_patron).to be_an_instance_of Patron
  end

  it 'reads out the name of a patron' do
    test_patron = Patron.new("Jane Doe")
    expect(test_patron.name).to eq("Jane Doe")
  end

  it 'starts out with an empty array of books' do
    test_patron = Patron.new("Jane Doe")
    expect(test_patron.books).to eq []
  end
end

