class Book
  def initialize(name, author)
    @name = name
    @author = author
    @information = @name + " by " + @author
    timenow = Time.new
    futuretime = timenow + 1814400
    @due_date = futuretime.strftime("%A, %B %d, %Y")
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

  def due_date
    @due_date
  end

end
