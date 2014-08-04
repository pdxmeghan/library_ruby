class Patron
  @@all_patrons = []

  def Patron.clear
    @@all_patrons =[]
  end

  def initialize(name)
    @name = name
    @books = []
  end

  def Patron.all
    @@all_patrons
  end

  def save
    @@all_patrons << self
  end

  def name
    @name
  end

  def add_book(book)
    @books << book
  end

  def books
    @books
  end
end
