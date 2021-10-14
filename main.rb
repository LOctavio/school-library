require_relative './student'
require_relative './teacher'

class Main
  def initialize
    @books = []
    @persons = []
  end

  def show_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def show_people
    @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(person)
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    case person
    when 1
      puts 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp
      @persons.push(Student.new(age, name, parent_permission))
    when 2
      puts 'Specialization:'
      specialization = gets.chomp
      @persons.push(Teacher.new(age, name, specialization))
    end
    puts 'Person created successfully'
  end
end
