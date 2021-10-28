require_relative './book_list'
require_relative './people_list'

class RentalList
  def initialize(books, people)
    @books = books
    @people = people
    file = File.open('data/rentals.json', 'a+')
    @rentals = file.size == 0 ? [] : JSON.parse(file.read)
    file.close
  end

  def add
    file = File.open('data/rentals.json', 'w')
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}" }
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person['className']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date)
    rental.book = @books[book]
    rental.person = @people[person]
    rental = rental.to_json
    @rentals.push(rental)
    file.write(JSON[@rentals])
    file.close
    puts 'Rental created successfully'
  end

  def show
    file = File.open('data/rentals.json', 'r')
    puts 'ID of person:'
    id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental['person']['id'] == id }
    rentals.each do |rental|
      puts "Date: #{rental['date']}, Book #{rental['book']['title']} by #{rental['book']['author']}"
    end
    file.close
  end
end
