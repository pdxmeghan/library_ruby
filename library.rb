require './lib/patron'
require './lib/book'
require 'pry'

def patron_menu
  loop do
    puts "Welcome to the library."
    puts "Press 'a' to add a new patron."
    puts "Press 's' to see all patrons."
    puts "Press 'x' to exit the program."
    patron_choice = gets.chomp
    if patron_choice == 'a'
      add_patron
    elsif patron_choice == 's'
      see_patrons
    elsif patron_choice == 'x'
      puts "Goodbye!"
      exit
    else
      puts "Sorry! Please enter a valid option."
    end
  end
end

def add_patron
  puts "Please enter the name of the library patron you would like to add."
  patron_input = gets.chomp
  Patron.new(patron_input).save
  puts "\n"
  puts "Thanks! This new patron has been added."
  puts "\n"
  patron_menu
end

def see_patrons
  puts "Here is a list of all of the patrons."
  Patron.all.each do |patron|
    puts patron.name
  end
  puts "\n"
  puts "Enter the name of a patron to see their account."
  patron_choice = gets.chomp
  Patron.all.each do |patron|
    if patron_choice == patron.name
      @selected_patron = patron
    end
  end
  puts "\n"
  book_menu
end

def book_menu
  loop do
    puts "Press 'c' to check out a book."
    puts "Press 'r' to return a book."
    puts "Press 'l' to list all books currently checked out."
    puts "Press 't' to see all returned books."
    puts "Press 'p' to go back to the patron menu"
    puts "Press 'x' to exit the library."
    input_choice = gets.chomp
    if input_choice == 'c'
      check_out_book
    elsif input_choice == 'r'
      return_book
    elsif input_choice == 'l'
      list_books
    elsif input_choice == 't'
      returned_books
    elsif input_choice == 'p'
      patron_menu
    elsif input_choice == 'x'
      puts "Adios!"
      exit
    else
      puts "Please input a valid option."
    end
  end
end

def check_out_book
  puts "What is the name of the book you're checking out?"
  title_input = gets.chomp
  puts "Who is the author of the book you're checking out?"
  author_input = gets.chomp
  puts "\n"
  new_book = Book.new(title_input, author_input)
  @selected_patron.add_book(new_book)
  puts "You checked out #{new_book.information}, Due on: #{new_book.due_date}"
  puts "\n"
  puts "#{@selected_patron.name} has these books checked out:"
  @selected_patron.books.each do |book|
    puts book.information + ", Due on: #{book.due_date}"
  end
  puts "\n"
  book_menu
end

def return_book
  puts "What is the name of the book you're returning?"
  title_input = gets.chomp
  return_book = @selected_patron.books.detect {|book| book.name == title_input }
  if return_book
    puts "Your book has been returned. Thanks!"
    puts "\n"
    @selected_patron.books.delete(return_book)
    @selected_patron.return_book(return_book)
    book_menu
  else
    puts "Sorry! You have not checked out a book matching that title."
    puts "\n"
    book_menu
  end
end

def list_books
  puts "#{@selected_patron.name} has these books checked out:"
  @selected_patron.books.each do |book|
    puts book.information + ", Due on #{book.due_date}"
  end
  puts"\n"
  book_menu
end

def returned_books
  puts "#{@selected_patron.name} has returned these books:"
  @selected_patron.returned_books.each do |book|
    puts book.information
  end
  puts "\n"
  book_menu
end

patron_menu
