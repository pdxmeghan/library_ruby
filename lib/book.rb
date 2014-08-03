class Book
  def initialize(name, author)
    @name = name
    @author = author
    @information = @name + " by " + @author
  end

  def information
    @information
  end
end
