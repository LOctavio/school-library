require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/bookList'
require_relative 'classes/peopleList'

class Main
  def initialize
    @bookList = BookList.new
    @peopleList = PeopleList.new
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @bookList.books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    @peopleList.people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date)
    rental.book = @bookList.books[book]
    @peopleList.people[person].add_rental(rental)
    puts 'Rental created successfully'
  end

  def show_rentals
    puts 'ID of person:'
    id = gets.chomp.to_i
    person_selected = @peopleList.people.select { |person| person.id == id }
    person_selected[0].rental.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
  end

  def app_info
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def show_options(option)
    case option
    when 1
      @bookList.show
    when 2
      @peopleList.show
    when 6
      show_rentals
    end
  end

  def create_options(option)
    case option
    when 3
      puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
      option = gets.chomp.to_i
      @peopleList.add(option)
    when 4
      @bookList.add
    when 5
      create_rental
    end
  end

  def app_options(option)
    show_options(option)
    create_options(option)
  end

  def main
    loop do
      app_info
      option = gets.chomp.to_i
      app_options(option)
      if option == 7
        puts 'Thank you for using this app!'
        break
      end
      puts ''
    end
  end
end

app = Main.new
app.main
