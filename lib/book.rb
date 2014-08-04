class Book
  def initialize(name, author)
    @name = name
    @author = author
    @information = @name + " by " + @author
  end

  def information
    @information
  end

  def name
    @name
  end

  def author
    @author
  end

  def add_due_date(date)
    @due_date = date
  end

  def due_date
    @due_date
  end

end
