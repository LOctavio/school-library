require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class Main
  def initialize
    @books = []
    @people = []
  end

  def show_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
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

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date)
    rental.book = @books[book]
    @people[person].add_rental(rental)
    puts 'Rental created successfully'
  end
end
