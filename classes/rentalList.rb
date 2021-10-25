require_relative './bookList'
require_relative './peopleList'

class RentalList
  def initialize(books, people)
    @books = books
    @people = people
  end

  def add
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

  def show
    puts 'ID of person:'
    id = gets.chomp.to_i
    person_selected = @people.select { |person| person.id == id }
    person_selected[0].rental.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
  end
end