require_relative './book_list'
require_relative './people_list'
require_relative './rental_list'

class Options
  def initialize
    @book_list = BookList.new
    @people_list = PeopleList.new
  end

  def show_list
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
      @book_list.show
    when 2
      @people_list.show
    when 6
      rental_list = RentalList.new(@book_list.books, @people_list.people)
      rental_list.show
    end
  end

  def create_options(option)
    case option
    when 3
      puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
      option = gets.chomp.to_i
      @people_list.add(option)
    when 4
      @book_list.add
    when 5
      rental_list = RentalList.new(@book_list.books, @people_list.people)
      rental_list.add
    end
  end

  def app_options(option)
    show_options(option)
    create_options(option)
  end
end
