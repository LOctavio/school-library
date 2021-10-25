require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/bookList'

class Main
  def initialize
    @bookList = BookList.new
    @people = []
  end

  def show_people
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(person)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    case person
    when 1
      puts 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp
      @people.push(Student.new(age, name, parent_permission))
    when 2
      puts 'Specialization:'
      specialization = gets.chomp
      @people.push(Teacher.new(age, name, specialization))
    end
    puts 'Person created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @bookList.books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date)
    rental.book = @bookList.books[book]
    @people[person].add_rental(rental)
    puts 'Rental created successfully'
  end

  def show_rentals
    puts 'ID of person:'
    id = gets.chomp.to_i
    person_selected = @people.select { |person| person.id == id }
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
      show_people
    when 6
      show_rentals
    end
  end

  def create_options(option)
    case option
    when 3
      puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
      option = gets.chomp.to_i
      create_person(option)
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
