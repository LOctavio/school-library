require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/options'
require_relative 'classes/book_list'
require_relative 'classes/people_list'


class Main
  def initialize
    @options = Options.new
  end

  def main
    loop do
      puts 'Welcome to School Library App!'
      puts ''
      @options.show_list
      option = gets.chomp.to_i
      @options.app_options(option)
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
