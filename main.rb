class Main
  def initialize
    @books = []
    @persons = []
  end

  def show_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end
end
